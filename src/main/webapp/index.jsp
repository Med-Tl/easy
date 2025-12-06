<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>DevOps Mini-Project</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #eef2f7;
            color: #333;
        }
        .container {
            max-width: 900px;
            margin: 60px auto;
            background: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #1a73e8;
            margin-bottom: 20px;
            font-size: 2.2em;
        }
        p {
            font-size: 1.1em;
            line-height: 1.6;
            margin-bottom: 20px;
        }
        ul {
            margin-left: 20px;
            line-height: 1.6;
        }
        .footer {
            margin-top: 30px;
            font-size: 0.9em;
            color: #777;
            border-top: 1px solid #ddd;
            padding-top: 15px;
        }
        .highlight {
            font-weight: bold;
            color: #1a73e8;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>DevOps Mini-Project</h1>
        <p>Bienvenue dans votre mini-projet DevOps, une démonstration complète de l'automatisation CI/CD et du monitoring moderne. Cette application intègre :</p>
        <ul>
            <li>Compilation et gestion de projet avec <span class="highlight">Maven</span></li>
            <li>Analyse de sécurité <span class="highlight">SAST</span> et <span class="highlight">DAST</span></li>
            <li>Déploiement automatique sur <span class="highlight">Apache Tomcat</span></li>
            <li>Surveillance et métriques avec <span class="highlight">Prometheus</span> et <span class="highlight">Grafana</span></li>
        </ul>
        <p>Le pipeline CI/CD couvre l'ensemble des étapes étudiées dans votre formation : gestion de version (<span class="highlight">Git</span> / <span class="highlight">GitHub</span>), intégration continue (<span class="highlight">Jenkins</span>), qualité du code (<span class="highlight">SonarQube</span>), sécurité (<span class="highlight">OWASP ZAP</span>) et monitoring.</p>
        <div class="footer">
            Ce projet a été réalisé et déployé automatiquement via Jenkins par <strong>Mohamed Tlili</strong>.
        </div>
    </div>
</body>
</html>
