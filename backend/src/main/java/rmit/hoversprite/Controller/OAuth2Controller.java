package rmit.hoversprite.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseCookie;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletResponse;
import rmit.hoversprite.DTO.UserDTO.UserDTO;
import rmit.hoversprite.Model.User.Farmer;
import rmit.hoversprite.Services.FarmerService;
import rmit.hoversprite.Services.UserService;
import rmit.hoversprite.Utils.DTOConverter;
import rmit.hoversprite.Utils.Enum.Role;
import rmit.hoversprite.Utils.JwtUtil;
import rmit.hoversprite.Utils.PasswordGenerator;
import rmit.hoversprite.Utils.Utils;

@RestController
@RequestMapping("/")
@CrossOrigin(origins = "http://localhost:3000", allowCredentials = "true") // Allow requests from this origin
public class OAuth2Controller {

    @Autowired
    JwtUtil util;

    @Autowired
    Utils utilsClass;

    @Autowired
    FarmerService farmerService;

    @Autowired
    UserService userService;

    @Autowired
    PasswordGenerator passwordGenerator;

    @PostMapping("api/oauth/config")
    public ResponseEntity<UserDTO> checkFarmerOAuth(@RequestParam String email, @RequestParam String name, HttpServletResponse response) {
        // Retrieve the farmer by email
        Farmer farmer = farmerService.getFarmerByEmail(email);
        if(farmer == null)
        {
            farmer = handleUnauthenticateFarmer(email, name);
        }

        // Generate the JWT token
        String token = util.generateToken(farmer.getEmail());
        System.out.println("Farmer full name: " + name);
        farmer.setToken(token);
        // Convert farmer data to UserDTO and include the token
        UserDTO userDTO = new DTOConverter().convertUserDataToObject(farmer);

        System.out.println("Token: " + userDTO.getToken());

        // Create a cookie to store the JWT token
        ResponseCookie jwtCookie = ResponseCookie.from("jwt", token)
                .httpOnly(true)
                .secure(false)  // Set to true in production (for HTTPS)
                .path("/")
                .maxAge(7 * 24 * 60 * 60)  // Token valid for 7 days
                .sameSite("Lax")  // Prevent CSRF
                .build();

        // Add the cookie to the response header
        response.addHeader("Set-Cookie", jwtCookie.toString());

        // Return the UserDTO object to the client as the response body
        return ResponseEntity.ok(userDTO);
    }

    private Farmer handleUnauthenticateFarmer(String email, String fullName)
    {
        Farmer farmer = new Farmer();
        farmer.setEmail(email);
        farmer.setFullName(fullName);
        farmer.setFirstName(utilsClass.extractFirstName(fullName));
        farmer.setLastName(utilsClass.extractLastName(fullName));
        farmer.setRole(Role.Farmer);
        farmer.setPassword(passwordGenerator.generateRandomPassword());
        return (Farmer) userService.register(farmer);
    }
}

