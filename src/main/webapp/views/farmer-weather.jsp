<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AgriCare Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            min-height: 100vh;
            background-color: #f0f0d8;
        }

        .sidebar {
            width: 200px;
            background-color: #f0f0d8;
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
            border-top-right-radius: 30px;
            border-bottom-right-radius: 10px;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
        }

        .sidebar img {
            max-width: 120px;
            margin-bottom: 10px;
        }

        .sidebar h2 {
            font-size: 18px;
            margin-bottom: 40px;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
            width: 100%;
            margin-top: 20px;
        }

        .sidebar ul li {
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            justify-content: flex-start;
            transition: transform 0.3s ease-in-out;
        }

        .sidebar ul li:hover {
            transform: scale(1.05);
        }

        .sidebar ul li img {
            margin-right: 10px;
            width: 25px;
            height: 25px;
        }

        .sidebar ul li a {
            text-decoration: none;
            color: #333;
            font-size: 18px;
        }

        .main-content {
            flex-grow: 1;
            padding: 20px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }

        .header h1 {
            font-size: 50px;
            color: #ff9900;
        }

        .header .profile {
            display: flex;
            align-items: center;
        }

        .header .profile img {
            border-radius: 50%;
            margin-right: 10px;
        }

        .header .profile span {
            font-size: 16px;
            color: #333;
        }

        .card {
            width: 1000px;
            height: 450px;
            background-color: #fff;
            padding: 20px;
            border-radius: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            margin-bottom: 20px;
            margin-top: 10px;
            position: relative;
            display: flex;
            flex-direction: column;
            margin-left: 20px;
            overflow-y: auto;
            align-items: center;
            justify-content: flex-start;
        }

        .card h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .weather-section {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .location-input {
            padding: 10px;
            font-size: 16px;
            width: 300px;
            border-radius: 8px;
            border: 1px solid #ccc;
            margin-bottom: 15px;
        }

        .get-weather-button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }

        #weather-result {
            margin-top: 20px;
            font-size: 18px;
            text-align: center;
        }

        .back-button-container {
            width: 100%;
            display: flex;
            justify-content: center;
            margin-top: 30px;
        }

        .button.back {
            padding: 10px 30px;
            background-color: #ff4c4c;
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <img src="../image/dash-logo.png" alt="Logo">
        <h2>AgriCare</h2>
        <ul>
            <li><img src="../image/dashboard-icon.png" alt="Dashboard Icon"><a href="#dashboard">Dashboard</a></li>
            <li><img src="../image/setting-icon.png" alt="Setting Icon"><a href="farmer-setting.jsp">Setting</a></li>
            <li><img src="../image/History-icon.png" alt="History Icon"><a href="farmer-history.jsp">History</a></li>
        </ul>
    </div>

    <div class="main-content">
        <div class="header">
            <h1>Agriculture & Organic Market</h1>
            <div class="profile">
                <img src="../image/profile-icon.png" alt="Profile Picture" width="40" height="40">
                <span>Mukesh Kumar</span>
            </div>
        </div>

        <div class="card">
            <h2>Weather Forecast</h2>

            <div class="weather-section">
                <input class="location-input" type="text" placeholder="Enter the location" />
                <button class="get-weather-button">Get Weather</button>
                <div id="weather-result"></div>
            </div>
        </div>

        <div class="back-button-container">
            <button class="button back" onclick="window.location.href='dashboard.jsp'">Go Back</button>
        </div>
    </div>

    <script>
        const apiKey = "387312ddc158f176d1b42890cd6300de"; // Replace with your real OpenWeatherMap API key

        document.querySelector(".get-weather-button").addEventListener("click", () => {
            const location = document.querySelector(".location-input").value;
            const resultBox = document.getElementById("weather-result");

            if (!location) {
                resultBox.textContent = "Please enter a location.";
                return;
            }

            const apiUrl = `https://api.openweathermap.org/data/2.5/weather?q=${location}&appid=${apiKey}&units=metric`;

            fetch(apiUrl)
                .then(response => {
                    if (!response.ok) {
                        throw new Error("Location not found");
                    }
                    return response.json();
                })
                .then(data => {
                    const temp = data.main.temp;
                    const description = data.weather[0].description;
                    const humidity = data.main.humidity;
                    const wind = data.wind.speed;

                    resultBox.innerHTML = `
                        <strong>Weather in ${location}:</strong><br>
                        Temperature: ${temp}°C<br>
                        Condition: ${description}<br>
                        Humidity: ${humidity}%<br>
                        Wind Speed: ${wind} m/s
                    `;
                })
                .catch(error => {
                    resultBox.textContent = "Unable to get weather data. Please try again.";
                    console.error(error);
                });
        });
    </script>
</body>
</html>
