<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>User Dashboard</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      display: flex;
      height: 100vh;
      background-color: #f4f6f8;
    }

    .sidebar {
      width: 250px;
      background-color: #d0e7ff; /* Light blue */
      color: black;
      padding: 30px 20px;
      box-shadow: 2px 0 8px rgba(0,0,0,0.1);
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    .profile-photo {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
      border: 3px solid #007bff;
      margin-bottom: 15px;
    }

    .user-name {
      font-size: 20px;
      font-weight: bold;
      margin-bottom: 30px;
      text-align: center;
    }

    .menu {
      list-style-type: none;
      padding: 0;
      width: 100%;
    }

    .menu li {
      background-color: #1a1a1a; /* Black */
      color: white;
      padding: 12px;
      margin: 8px 0;
      text-align: center;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .menu li:hover {
      background-color: #333;
    }

    .main-message {
      flex: 1;
      display: flex;
      justify-content: center;
      align-items: center;
      font-size: 28px;
      font-weight: bold;
      color: #333;
    }
  </style>
</head>
<body>
  <div class="sidebar">
    <img class="profile-photo" src="${model.image}" alt=" My Profile"/>
    <div class="user-name">${model.name}</div>
    <ul class="menu">
      <li>Option 1</li>
      <li>Option 2</li>
      <li>Option 3</li>
      <li>Option 4</li>
      <a href="exit"><li>Exit</li></a>
    </ul>
  </div>

  <div class="main-message">
    User Dashboard
  </div>
</body>
</html>

