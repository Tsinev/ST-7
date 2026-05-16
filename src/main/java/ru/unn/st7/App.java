package ru.unn.st7;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class App {
    public static void main(String[] args) {
        System.out.println("=== Задание №1: Генератор паролей ===");
        task1();

        System.out.println("\n=== Задание №2: Получение IP-адреса ===");
        Task2.main(args);

        System.out.println("\n=== Задание №3: Прогноз погоды ===");
        Task3.main(args);
    }

    public static void task1() {
        System.setProperty("webdriver.chrome.driver", "C:\\Users\\timur\\OneDrive\\Рабочий стол\\chromedriver-win64\\chromedriver.exe");
        WebDriver webDriver = new ChromeDriver();
        try {
            webDriver.get("https://www.calculator.net/password-generator.html");

            // Wait for page to load
            Thread.sleep(3000);

            // Find and click the generate button using XPath
            WebElement generateButton = webDriver.findElement(By.xpath("//input[@type='button' and contains(@value, 'Generate')]"));
            generateButton.click();

            // Wait a moment for the password to be generated
            Thread.sleep(1000);

            // Get the generated password - it's in an input field with id "password"
            WebElement passwordElement = webDriver.findElement(By.id("password"));
            String password = passwordElement.getAttribute("value");

            if (password == null || password.isEmpty()) {
                // Try alternative selector
                passwordElement = webDriver.findElement(By.name("password"));
                password = passwordElement.getAttribute("value");
            }

            System.out.println("Сгенерированный пароль: " + password);

        } catch (Exception e) {
            System.out.println("Error");
            System.out.println(e.toString());
        } finally {
            webDriver.quit();
        }
    }
}