<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPatient.aspx.cs" Inherits="PatientManagementSystem.AddPatient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">


<head runat="server">
    <title>Add Patient</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
        .form-heading {
            background-color: #007bff;
            color: #fff;
            padding: 10px;
            text-align: center;
            margin-bottom: 20px;
        }

        .container {
            margin-top: 50px;
        }

        #form-title
        {
            text-align: center;
        }

        #header
        {
            width:100vw;
            background-color: #10b981;
            box-shadow: 0 0 .1vw black;
            margin-bottom: 1vw;
            padding: 1vw 0vw;
            display: flex;
        }
        #logo
        {
            color: white;
            font-size: 30px;
            font-weight: bold;
            margin-left: 3vw;
             user-select:none;
        }
        #header-container
        {
            display: flex;
            margin-left: 4vw;

        }
        .header-button
        {
            font-size: 18px;
            font-weight: bold;
            color: white;
            align-self: center;
            margin-left: 1vw;
            text-decoration: none;
             user-select:none;
        }
    </style>
</head>


<body style="margin: 0vw;">
    <div id="header">
        <div id="logo">PSM</div>
        <div id="header-container">
            <a href="AddPatient.aspx" class="header-button">Add patient</a>
            <a href="ViewPatients.aspx" class="header-button">View patients</a>
        </div>
    </div>
  <div class="container">
    <div class="row">
      <div class="col-md-6 offset-md-3">
        <form onsubmit="submitPatientForm(event)" method="post" style="background-color:#f1f5f9; padding:30px; margin-top: 20px; margin-bottom: 20px;">
          <h3 id="form-title">Add Patient Details</h3>
          <div class="form-group">
            <label for="fname">First Name:</label>
            <input type="text" class="form-control" id="fname" placeholder="Enter first name" required>
          </div>

          <div class="form-group">
            <label for="mname">Middle Name:</label>
            <input type="text" class="form-control" id="mname" placeholder="Enter middle name" required>
          </div>

            
          <div class="form-group">
            <label for="lname">Last Name:</label>
            <input type="text" class="form-control" id="lname" placeholder="Enter last name" required>
          </div>
         
           <div class="form-group">
            <label for="gender">Gender:</label>
            <select class="form-control" id="gender" required>
              <option value="">Select</option>
              <option value="male">Male</option>
              <option value="female">Female</option>
              <option value="unknown">Unknown</option>
            </select>
          </div>

                        
          <div class="form-group">
            <label for="dob">Date of Birth:</label>
            <input type="date" class="form-control" id="dob" placeholder="Enter date of birth" required>
          </div>

           <div class="form-group">
            <label for="status">Status:</label>
            <select class="form-control" id="status" required>
              <option value="">Select</option>
              <option value="single">Single</option>
              <option value="married">Married</option>
              <option value="separated">Separated</option>
            </select>
          </div>

          <div class="form-group">
            <label for="addr1">Address 1:</label>
            <input type="text" class="form-control" id="addr1" placeholder="Enter address 1" required>
          </div>

            
          <div class="form-group">
            <label for="addr2">Address 2:</label>
            <input type="text" class="form-control" id="addr2" placeholder="Enter address 2" required>
          </div>

           <div class="form-group">
            <label for="city">City:</label>
            <input type="text" class="form-control" id="city" placeholder="Enter city name" required>
          </div>

           <div class="form-group">
            <label for="state">State:</label>
            <input type="text" class="form-control" id="state" placeholder="Enter state name" required>
          </div>

           <div class="form-group">
            <label for="zip">ZIP Code:</label>
            <input type="text" class="form-control" id="zip" placeholder="Enter zip code" required>
          </div>

           <div class="form-group">
            <label for="country">Country:</label>
            <input type="text" class="form-control" id="country" placeholder="Enter country name" required>
          </div>

           <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" class="form-control" id="email" placeholder="Enter email" required>
          </div>


            <div class="form-group">
              <label for="phoneNumber">Phone Number:</label>
              <input type="tel" class="form-control" id="phoneNumber" placeholder="Enter phone number (+92-3001234567)" pattern="^(\+92-)?(3\d{2})\d{7}$" required>
            </div>


           <div class="form-group">
            <label for="country">Language:</label>
            <input type="text" class="form-control" id="language" placeholder="Enter language" required>
          </div>

            <div class="form-group">
              <label for="pic">Picture:</label>
              <select class="form-control" id="pic" onchange="profileHandle(this.value)">
                <option value="upload">Upload</option>
                <option value="webcam">Webcam</option>
              </select>
            </div>

            <!-- Upload Image Option -->
            <div class="form-group" id="upload-profile-option">
              <input type="file" class="form-control-file" id="picture" accept="image/*" onchange="handleFileUpload()">
            </div>

            <div class="form-group" id="captured-image" style="display: none;">
                <img style="width:100%;" id="capturedImage" alt="Captured Image">
            </div>

            <!-- Webcam Option -->
            <div class="form-group" id="webcam-option" style="display: none;">
              <video style="width:100%;" id="webcam" autoplay></video>
              <canvas id="canvas" style="display: none;"></canvas>
              <button type="button" class="btn btn-primary" style="margin-top:10px;" id="captureButton" onclick="captureFromWebcam()">Capture</button>
              <button type="button" class="btn btn-secondary" style="margin-top:10px;" id="retakeButton" onclick="showWebcam()">Retake</button>
            </div>
         
          <button type="submit" class="btn btn-primary">Submit</button>
        </form>
      </div>
    </div>
  </div>

    <script>

        picURL = null
        function profileHandle(value) {
            const uploadProfileOption = document.getElementById('upload-profile-option');
            const webcamOption = document.getElementById('webcam-option');
            const capturedImageElement = document.getElementById('captured-image');

            if (value === 'upload') {
                uploadProfileOption.style.display = 'block';
                webcamOption.style.display = 'none';
                capturedImageElement.src = '';
                capturedImageElement.style.display = 'none';
                picURL = null
                stopWebcam();
            } else if (value === 'webcam') {
                uploadProfileOption.style.display = 'none';
                webcamOption.style.display = 'block';
                capturedImageElement.style.display = 'none';
                document.getElementById('webcam').style.display = 'block';
                picURL = null
                startWebcam();
            }
        }

        function handleFileUpload() {
            const fileInput = document.getElementById('picture');
            const file = fileInput.files[0];


            // Hide the webcam option
            document.getElementById('webcam-option').style.display = 'none';

            // Stop webcam stream if it's active
            stopWebcam();

            const reader = new FileReader();

            reader.onload = function (event) {
                picURL = event.target.result;
            };

            reader.readAsDataURL(file);
        }

        function startWebcam() {
            navigator.mediaDevices.getUserMedia({ video: true })
              .then(function (stream) {
                  const videoElement = document.getElementById('webcam');
                  videoElement.srcObject = stream;
              })
              .catch(function (error) {
                  console.error('Error accessing webcam:', error);
              });
        }

        function stopWebcam() {
            const videoElement = document.getElementById('webcam');
            const stream = videoElement.srcObject;
            if (stream) {
                const tracks = stream.getTracks();
                tracks.forEach(function (track) {
                    track.stop();
                });
                videoElement.srcObject = null;
            }
        }

        function captureFromWebcam() {
            const videoElement = document.getElementById('webcam');
            const canvasElement = document.getElementById('canvas');
            const capturedImageElement = document.getElementById('captured-image');
            const context = canvasElement.getContext('2d');
            context.drawImage(videoElement, 0, 0, canvasElement.width, canvasElement.height);
            const imageDataURL = canvasElement.toDataURL('image/jpeg'); // Use 'image/png' for PNG format
            picURL = imageDataURL
            document.getElementById('capturedImage').src = imageDataURL;
            capturedImageElement.style.display = 'block';
            stopWebcam();
            videoElement.style.display = 'none';
        }
        function showWebcam() {
            picURL = null
            document.getElementById('webcam').style.display = 'block';
            document.getElementById('webcam-option').style.display = 'block';
            document.getElementById('captured-image').style.display = 'none';
            startWebcam();
        }
    </script>


    <script>
        function submitPatientForm(event)
        {
            if(picURL!==null)
            {
                 event.preventDefault()
                    var formData = {
                        fname: $("#fname").val(),
                        mname: $("#mname").val(),
                        lname: $("#lname").val(),
                        gender: $("#gender").val(),
                        dob: $("#dob").val(),
                        status: $("#status").val(),
                        addr1: $("#addr1").val(),
                        addr2: $("#addr2").val(),
                        city: $("#city").val(),
                        state: $("#state").val(),
                        zip: $("#zip").val(),
                        country: $("#country").val(),
                        phone: $("#phoneNumber").val(),
                        email: $("#email").val(),
                        language: $("#language").val(),
                        picURL: JSON.stringify(picURL)
                    };
                $.ajax({
                    url: "AddPatient.aspx/Page_Load",
                    type: "POST",
                    data: formData,
                    success: function (response) {
                        alert("Success added patient");
                        location.reload();

                    },
                    error: function (xhr, textStatus, errorThrown) {
                        alert("Invalid Request Coming");
                    }
                });
            }
            else
            {
                event.preventDefault()
                alert('Please upload profile')
            }

        }

    </script>

   


  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
