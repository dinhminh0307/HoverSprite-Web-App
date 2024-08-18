package rmit.hoversprite.Services;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import rmit.hoversprite.Model.SprayerServices.SprayServices;
import rmit.hoversprite.Repositories.DBServiceRepository;
import rmit.hoversprite.Utils.Enum.CropType;
import rmit.hoversprite.Utils.Enum.ServiceName;
import rmit.hoversprite.Utils.Enum.ServiceType;
import rmit.hoversprite.Utils.Utils;

@Component
public class SprayerFeatureServices {
    @Autowired
    DBServiceRepository serviceRepository;

    @Autowired
    Utils utilsClass;

    public SprayServices createSerSprayServices(SprayServices sprayServices)
    {
        // Generate service id and assign it
        String generatedServiceId = utilsClass.generateSprayServiceId(serviceRepository.findAll());
        sprayServices.setId(generatedServiceId);
        return serviceRepository.save(sprayServices);
    }
    
    public List<SprayServices> listAllSprayServices()
    {
        return serviceRepository.findAll();
    }

    public List<SprayServices> filterBySearch(String searchTerm)
    {
        List<SprayServices> services =listAllSprayServices();
        try {
            ServiceName searchEnum = ServiceName.valueOf(searchTerm.toUpperCase());
            System.out.println(searchEnum);
            services = services.stream()
                .filter(service -> service.getServiceName() == searchEnum)
                .collect(Collectors.toList());
        } catch (IllegalArgumentException e) {
            // If the search term doesn't match any enum value, return an empty list
            services.clear();
        }
        return services;
    }

    public List<SprayServices> filterByCropType(String cropType)
    {
        // Filter by crop type
        List<SprayServices> services =listAllSprayServices();
        
            try {
                CropType cropEnum = CropType.valueOf(cropType.toUpperCase());
                services = services.stream()
                    .filter(service -> service.getCropType() == cropEnum)
                    .collect(Collectors.toList());
            } catch (IllegalArgumentException e) {
                // If the crop type doesn't match any enum value, return an empty list
                services.clear();
            }
        
        return services;
    }

    public List<SprayServices> filterByServiceType(String serviceType)
    {
        List<SprayServices> services =listAllSprayServices();

        
            try {
                ServiceType serviceEnum = ServiceType.valueOf(serviceType.toUpperCase());
                services = services.stream()
                    .filter(service -> service.getServiceType() == serviceEnum)
                    .collect(Collectors.toList());
            } catch (IllegalArgumentException e) {
                // If the service type doesn't match any enum value, return an empty list
                services.clear();
            }

        return services;
    }
}