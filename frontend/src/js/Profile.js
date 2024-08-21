const UserURL = 'http://localhost:8080/userName';
const UpdateProfileUrl = 'http://localhost:8080/updateProfile';

document.addEventListener("DOMContentLoaded", function() {
    loadNavBar();
    loadFooter();
    fetchUserData();
    initializeProfileButtons();
});

function fetchUserData() {
    sendRequestWithToken(UserURL)
        .then(data => {
            console.log(data);
            updateProfileInfo(data);
            populateFormFields(data);
        })
        .catch(error => console.error('Error fetching user data:', error));
}

function updateProfileInfo(data) {
    document.getElementById('profileName').textContent = data.fullName || 'John Smith';
    document.getElementById('profileUsername').textContent = '@' + (data.username || 'john');
    document.getElementById('profileEmail').textContent = 'Email: ' + (data.email || 'demomail@mail.com');
    document.getElementById('firstNameDisplay').textContent = data.firstName || 'John';
    document.getElementById('lastNameDisplay').textContent = data.lastName || 'Doe';
    document.getElementById('emailDisplay').textContent = data.email || 'demomail@mail.com';
    document.getElementById('phoneNumberDisplay').textContent = data.phoneNumber || '123-456-7890';

    if (data.profileImage) {
        document.getElementById('profileImage').src = data.profileImage;
    }
}

function populateFormFields(data) {
    document.getElementById('firstName').value = data.firstName || '';
    document.getElementById('lastName').value = data.lastName || '';
    document.getElementById('email').value = data.email || '';
    document.getElementById('phoneNumber').value = data.phoneNumber || '';
}

function uploadImage() {
    // Firebase configuration for your web app
    const firebaseConfig = {
        apiKey: "AIzaSyD3hUpNFgAwXxlpsGs2sfI6Fgp3MOgXanA",
        authDomain: "hoversprite-3d6b3.firebaseapp.com",
        projectId: "hoversprite-3d6b3",
        storageBucket: "hoversprite-3d6b3.appspot.com",
        messagingSenderId: "375398691957",
        appId: "1:375398691957:web:ce8d343181d0e843cef43c",
        measurementId: "G-M1Q0WXPBE6"
    };
    
    // Initialize Firebase
    firebase.initializeApp(firebaseConfig);
    const storage = firebase.storage();

    const file = document.querySelector("#profileImageUpload").files[0];
    if (!file) return Promise.resolve(null); // If no file is selected, resolve to null

    const ref = storage.ref();
    const name = +new Date() + "-" + file.name;
    const metadata = { contentType: file.type };
    const task = ref.child(name).put(file, metadata);

    return task
        .then(snapshot => snapshot.ref.getDownloadURL())
        .catch(console.error);
}

function initializeProfileButtons() {
    const profileForm = document.querySelector('.profile-form');
    const profileInfo = document.querySelector('.profile-info');
    const editBtn = document.querySelector('.edit-btn');
    const cancelBtn = document.querySelector('.cancel-btn');
    const profileImage = document.getElementById('profileImage');

    editBtn.addEventListener('click', function() {
        profileForm.style.display = 'block';
        profileInfo.style.display = 'none';
        editBtn.style.display = 'none';
    });

    cancelBtn.addEventListener('click', function() {
        profileForm.style.display = 'none';
        profileInfo.style.display = 'block';
        editBtn.style.display = 'block';
    });

    document.getElementById('profileImageUpload').addEventListener('change', function(e) {
        const file = e.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(event) {
                profileImage.src = event.target.result; // Display the image preview
            };
            reader.readAsDataURL(file); // Read the image file as a data URL
        }
    });

    profileForm.addEventListener('submit', function(e) {
        e.preventDefault();

        uploadImage().then(profileImageUrl => {
            if (profileImageUrl) {
                submitProfileFormWithImage(profileImageUrl);
            } else {
                sendUpdateWithoutImage();
            }
        });
    });
}

function submitProfileFormWithImage(imageUrl) {
    const userProfile = {
        profileImage: imageUrl,
        firstName: document.getElementById('firstName').value,
        lastName: document.getElementById('lastName').value,
        email: document.getElementById('email').value,
        phoneNumber: document.getElementById('phoneNumber').value
    };

    sendRequestWithToken(UpdateProfileUrl, 'PUT', userProfile)
        .then(data => {
            console.log(data);
            finalizeProfileUpdate();
        })
        .catch(error => {
            console.error('Error updating profile:', error);
            alert('Failed to update profile.');
        });
}

function sendUpdateWithoutImage() {
    const userProfile = {
        firstName: document.getElementById('firstName').value,
        lastName: document.getElementById('lastName').value,
        email: document.getElementById('email').value,
        phoneNumber: document.getElementById('phoneNumber').value
    };

    sendRequestWithToken(UpdateProfileUrl, 'PUT', userProfile)
        .then(data => {
            console.log(data);
            finalizeProfileUpdate();
        })
        .catch(error => {
            console.error('Error updating profile:', error);
            alert('Failed to update profile.');
        });
}

function finalizeProfileUpdate() {
    const profileForm = document.querySelector('.profile-form');
    const profileInfo = document.querySelector('.profile-info');
    const editBtn = document.querySelector('.edit-btn');

    profileForm.style.display = 'none';
    profileInfo.style.display = 'block';
    editBtn.style.display = 'block';
    fetchUserData(); // Refresh the profile info
}

function loadNavBar() {
    const navbarContainer = document.getElementById("navbar-container");
    sendRequestWithToken(UserURL)
        .then(data => {
            navbarContainer.innerHTML = returnNavBar(data.email);
            activeClick();
        })
        .catch(error => console.error('Error loading navbar:', error));
}

function loadFooter() {
    const footerContainer = document.getElementById("footer-container");
    footerContainer.innerHTML = returnFooter();
}
