package ru.unn.st7;

import java.util.List;
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
            Thread.sleep(3000);
            String pageSource = webDriver.getPageSource();
            System.out.println("Страница загружена, длина: " + pageSource.length() + " символов");
            String password = null;
            try {
                WebElement passwordElement = webDriver.findElement(By.id("password"));
                if (passwordElement != null) {
                    password = passwordElement.getAttribute("value");
                    if (password == null || password.isEmpty()) {
                        password = passwordElement.getText();
                    }
                    System.out.println("Найден элемент с id='password': " + password);
                }
            } catch (Exception e) {
            }
            if (password == null || password.isEmpty()) {
                try {
                    List<WebElement> elements = webDriver.findElements(By.xpath("//div[contains(text(), 'Password')]"));
                    for (WebElement elem : elements) {
                        String text = elem.getText();
                        System.out.println("Найден элемент: " + text.replace("\n", "\\n"));
                        String[] lines = text.split("\n");
                        for (String line : lines) {
                            String trimmed = line.trim();
                            if (!trimmed.isEmpty() && !trimmed.equals("Password") && 
                                !trimmed.contains("Strength") && !trimmed.contains("Entropy") &&
                                trimmed.length() >= 6 && trimmed.length() <= 32) {
                                password = trimmed;
                                break;
                            }
                        }
                        if (password != null && !password.isEmpty()) break;
                    }
                } catch (Exception e) {
                }
            }
            if (password == null || password.isEmpty()) {
                try {
                    WebElement passwordElement = webDriver.findElement(By.cssSelector(".password-output, .pass-output, #passwd"));
                    if (passwordElement != null) {
                        password = passwordElement.getText();
                        if (password == null || password.isEmpty()) {
                            password = passwordElement.getAttribute("value");
                        }
                    }
                } catch (Exception e) {
                }
            }
            if (password == null || password.isEmpty()) {
                try {
                    WebElement button = webDriver.findElement(By.xpath("//input[@type='button']"));
                    if (button != null) {
                        System.out.println("Найдена кнопка: " + button.getAttribute("value"));
                        button.click();
                        Thread.sleep(1000);
                        try {
                            WebElement passwordElement = webDriver.findElement(By.id("password"));
                            password = passwordElement.getAttribute("value");
                            if (password == null || password.isEmpty()) {
                                password = passwordElement.getText();
                            }
                        } catch (Exception e2) {
                        }
                    }
                } catch (Exception e) {
                }
            }
            if (password == null || password.isEmpty()) {
                int passwordIndex = pageSource.indexOf("Password");
                if (passwordIndex != -1) {
                    String afterPassword = pageSource.substring(passwordIndex);
                    int endIndex = afterPassword.indexOf("<");
                    if (endIndex > 10 && endIndex < 50) {
                        String potentialPassword = afterPassword.substring(8, endIndex).trim();
                        if (potentialPassword.length() > 5 && potentialPassword.length() < 50) {
                            password = potentialPassword;
                        }
                    }
                }
            }
            if (password != null && !password.isEmpty()) {
                System.out.println("Сгенерированный пароль: " + password);
            } else {
                System.out.println("Пароль не найден (возможно, структура страницы изменилась)");
                String bodyText = webDriver.findElement(By.tagName("body")).getText();
                System.out.println("Текст страницы (первые 500 символов): " + bodyText.substring(0, Math.min(500, bodyText.length())));
            }
        } catch (Exception e) {
            System.out.println("Error");
            System.out.println(e.toString());
        } finally {
            webDriver.quit();
        }
    }
}