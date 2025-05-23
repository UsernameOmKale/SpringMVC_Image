<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Glowing Registration Form</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      background: #0f0f0f;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      display: flex;
      flex-direction: column;
      align-items: center;
      min-height: 100vh;
    }

    .header {
      width: 100%;
      background: #111;
      padding: 20px;
      text-align: center;
      box-shadow: 0 2px 10px #0ff;
      margin-bottom: 30px;
    }

    .header nav a {
      color: #00f2ff;
      text-decoration: none;
      margin: 0 20px;
      font-weight: bold;
      transition: 0.3s;
    }

    .header nav a:hover {
      color: lightpink;
    }

    .container {
      background: #111;
      padding: 40px;
      border-radius: 15px;
      box-shadow: 0 0 25px #00f2ff55;
      animation: pulseBox 3s infinite ease-in-out;
    }

    .reg-form {
      display: flex;
      flex-direction: column;
      gap: 20px;
    }

    .reg-form h2 {
      color: #0ff;
      text-align: center;
      text-shadow: 0 0 5px #0ff;
    }

    .reg-form input {
      padding: 12px;
      border: none;
      border-radius: 8px;
      background-color: #222;
      color: #fff;
      box-shadow: 0 0 5px #00f2ff;
      outline: none;
      transition: 0.3s;
    }

    .reg-form input:focus {
      box-shadow: 0 0 15px #0ff;
    }

    .reg-form button {
      padding: 12px;
      border: none;
      border-radius: 8px;
      background: linear-gradient(45deg, #0ff, #00f2ff);
      color: #000;
      font-weight: bold;
      cursor: pointer;
      transition: 0.4s ease;
      text-shadow: 0 0 5px #fff;
      box-shadow: 0 0 20px #00f2ff;
      animation: lightningGlow 1.5s infinite;
    }

    .reg-form button:hover {
      background: lightpink;
      transform: scale(1.05);
      box-shadow: 0 0 40px #00f2ff;
    }

    .image-preview {
      display: none;
      margin-bottom: 20px;
      text-align: center;
    }

    .image-preview img {
      max-width: 100%;
      max-height: 100px;
      border-radius: 10px;
      box-shadow: 0 0 15px #0ff;
    }

    @keyframes lightningGlow {
      0%, 100% {
        box-shadow: 0 0 15px #0ff, 0 0 30px #00f2ff;
      }
      50% {
        box-shadow: 0 0 25px #00f2ff, 0 0 50px #0ff;
      }
    }

    @keyframes pulseBox {
      0%, 100% {
        box-shadow: 0 0 25px #00f2ff55;
      }
      50% {
        box-shadow: 0 0 40px #00f2ffaa;
      }
    }

    @keyframes glowText {
      from {
        text-shadow: 0 0 5px #0ff, 0 0 10px #00f2ff;
      }
      to {
        text-shadow: 0 0 15px #00f2ff, 0 0 25px #0ff;
      }
    }

    .message-box {
      margin-top: 30px;
      padding: 15px 25px;
      color: #0ff;
      text-align: center;
      font-weight: bold;
      font-size: 1.2rem;
      text-shadow: 0 0 5px #0ff, 0 0 10px #00f2ff;
      box-shadow: 0 0 15px #00f2ff55;
      background-color: #111;
      border-radius: 10px;
      display: inline-block;
      animation: glowText 2s infinite alternate;
    }
  </style>
</head>
<body>

  <!-- Header with Register & Login links -->
  <div class="header">
    <nav>
      <a href="index">Register</a>
      <a href="login">Login</a>
    </nav>
  </div>

  <!-- Registration Form -->
  <div class="container">
    <form class="reg-form" action="saveData" enctype="multipart/form-data" method="post">
      <h2>Register</h2>
      <div class="image-preview" id="imagePreview">
        <img id="previewImg" src="" alt="Selected Image" />
      </div>

      <input type="text" name="name" placeholder="Full Name" required />
      <input type="text" name="username" placeholder="Username" required />
      <input type="password" name="password" placeholder="Password" required />
      <input type="file" id="image" name="imageFile" accept="image/*" onchange="previewImage(event)" />
      <button type="submit">Sign Up</button>
    </form>    
  </div>

  <!-- Glowing Message -->
  <div class="message-box">${model}</div>

  <script>
    function previewImage(event) {
      const previewContainer = document.getElementById('imagePreview');
      const previewImg = document.getElementById('previewImg');
      const file = event.target.files[0];

      if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
          previewImg.src = e.target.result;
          previewContainer.style.display = 'block';
        };
        reader.readAsDataURL(file);
      }
    }
  </script>
</body>
</html>
