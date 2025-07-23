# **MyRobotFrameworkTests** 🤖

A Robot Framework test automation project for UI, API, and other testing needs. This repository contains reusable test cases, custom keywords, and integration with CI/CD pipelines.

## **📌 Table of Contents**
- [Project Overview](#-project-overview)
- [Prerequisites](#-prerequisites)
- [Installation](#-installation)
- [Project Structure](#-project-structure)
- [Running Tests](#-running-tests)
- [CI/CD Integration](#-cicd-integration)
- [Contributing](#-contributing)
- [License](#-license)

---

## **🚀 Project Overview**
This repository contains automated test scripts built using **Robot Framework**, a generic open-source automation framework. The tests cover:
- **Web UI Testing** (using SeleniumLibrary)  
- **API Testing** (using RequestsLibrary)  
- **Database Testing** (optional)  
- **Custom Keywords & Utilities**  

---

## **🔧 Prerequisites**
Before running the tests, ensure you have the following installed:
- Python **3.7+** ([Download Python](https://www.python.org/downloads/))
- Robot Framework  
  ```bash
  pip install robotframework
  ```
- Required libraries:  
  ```bash
  pip install robotframework-seleniumlibrary robotframework-requests
  ```
- (Optional) Browser drivers (e.g., ChromeDriver for Selenium)  

---

## **📥 Installation**
1. **Clone the repository**:
   ```bash
   git clone https://github.com/HassenDAI-QA/MyRobotFrameworkTests.git
   cd MyRobotFrameworkTests
   ```
2. **Install dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

---

## **📂 Project Structure**
```
MyRobotFrameworkTests/
├── tests/                  # Test suites (.robot files)
│   ├── web_ui/             # UI test cases
│   ├── api/                # API test cases
│   └── database/           # Database tests (if applicable)
├── resources/              # Shared keywords & variables
│   ├── common_keywords.robot
│   └── config.robot
├── libraries/              # Custom Python/Java libraries
├── results/                # Test output (logs, reports)
├── .github/workflows/      # CI/CD workflows (GitHub Actions)
├── requirements.txt        # Python dependencies
└── README.md               # Project documentation
```

---

## **▶️ Running Tests**
### **Run all tests**
```bash
robot tests/
```
### **Run specific test suite**
```bash
robot tests/web_ui/login_tests.robot
```
### **Run with tags**
```bash
robot --include=smoke tests/
```
### **Generate reports**
- Reports (`log.html`, `report.html`, `output.xml`) are saved in the `results/` folder by default.

---

## **⚙️ CI/CD Integration**
This project supports **GitHub Actions** for automated test execution.  
- Workflow file: `.github/workflows/robot-tests.yml`  
- Triggers on `push` & `pull_request`  

To set up:
1. Ensure secrets (e.g., credentials) are configured in GitHub.
2. The workflow will install dependencies and run tests automatically.

---

## **🤝 Contributing**
Contributions are welcome! Follow these steps:
1. Fork the repository.  
2. Create a new branch (`git checkout -b feature/new-test`).  
3. Commit changes (`git commit -m "Add login test"`).  
4. Push to the branch (`git push origin feature/new-test`).  
5. Open a **Pull Request**.  

---

## **📜 License**
This project is licensed under **MIT License**. See [LICENSE](LICENSE) for details.

---

## **📧 Contact**
- **Author**: Hassen DAI  
- **Email**: Hassendai.info@gmail.com 
- **GitHub**: [HassenDAI-QA](https://github.com/HassenDAI-QA)  


