package ru.unn.st7;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

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
        WebDriverManager.chromedriver().setup();
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--disable-dev-shm-usage");
        options.addArguments("--disable-blink-features=AutomationControlled");
        options.setExperimentalOption("excludeSwitches", new String[]{"enable-automation"});
        options.setExperimentalOption("useAutomationExtension", false);
        WebDriver webDriver = new ChromeDriver(options);
        try {
            webDriver.get("https://www.calculator.net/password-generator.html");
            Thread.sleep(3000);
            
            WebElement passwordElement = webDriver.findElement(By.id("password"));
            String password = passwordElement.getAttribute("value");
            
            System.out.println("Сгенерированный пароль: " + password);
        } catch (Exception e) {
            System.out.println("Error");
            System.out.println(e.toString());
        } finally {
            webDriver.quit();
        }
    }
}