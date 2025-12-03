<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>DevOps</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f5f5f5;
        }
        .container {
            background: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
        }
        p {
            font-size: 16px;
            color: #444;
        }
        .footer {
            margin-top: 25px;
            font-size: 14px;
            color: #666;
            border-top: 1px solid #ddd;
            padding-top: 10px;
        }
    </style>
</head>

<body>
    <div class="container">
        <h1>DevOps</h1>

        <p>
            Bienvenue dans votre mini-projet DevOps.  
            Cette application fait partie de la chaîne CI/CD que vous avez mise en place comprenant :  
            compilation Maven, analyse SAST et DAST, déploiement automatique sur Tomcat, et monitoring avec Prometheus et Grafana.
        </p>

        <p>
            Le pipeline exécute l’ensemble des étapes DevOps étudiées dans votre formation :  
            Git, GitHub, Jenkins, SonarQube, Tomcat, OWASP ZAP et monitoring.
        </p>

        <div class="footer">
            Ce travail a été réalisé et déployé automatiquement via Jenkins par <strong>Mohamed Tlili</strong>.
        </div>
    </div>
</body>
</html>
