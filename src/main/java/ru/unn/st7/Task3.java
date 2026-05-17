package ru.unn.st7;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class Task3 {
    public static void main(String[] args) {
        WebDriverManager.chromedriver().setup();
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--disable-dev-shm-usage");
        options.addArguments("--disable-blink-features=AutomationControlled");
        options.setExperimentalOption("excludeSwitches", new String[]{"enable-automation"});
        options.setExperimentalOption("useAutomationExtension", false);
        WebDriver webDriver = new ChromeDriver(options);
        try {
            String url = "https://api.open-meteo.com/v1/forecast?latitude=56&longitude=44&hourly=temperature_2m,rain&current=cloud_cover&timezone=Europe%2FMoscow&forecast_days=1&wind_speed_unit=ms";
            webDriver.get(url);
            Thread.sleep(2000);
            String json_str = webDriver.findElement(By.tagName("body")).getText();
            JSONParser parser = new JSONParser();
            JSONObject obj = (JSONObject) parser.parse(json_str);
            JSONObject hourly = (JSONObject) obj.get("hourly");
            JSONArray times = (JSONArray) hourly.get("time");
            JSONArray temperatures = (JSONArray) hourly.get("temperature_2m");
            JSONArray rain = (JSONArray) hourly.get("rain");
            StringBuilder table = new StringBuilder();
            String nl = System.lineSeparator();
            table.append(String.format("%-5s | %-20s | %-12s | %-12s", "№", "Дата/время", "Температура", "Осадки (мм)")).append(nl);
            table.append("------|----------------------|--------------|--------------").append(nl);
            for (int i = 0; i < times.size(); i++) {
                String time = (String) times.get(i);
                double temp = ((Number) temperatures.get(i)).doubleValue();
                double rainVal = ((Number) rain.get(i)).doubleValue();
                table.append(String.format("%-5d | %-20s | %-12.1f | %-12.2f", i + 1, time, temp, rainVal)).append(nl);
            }
            System.out.println(table.toString());
            try (BufferedWriter writer = new BufferedWriter(new FileWriter("result/forecast.txt"))) {
                writer.write(table.toString());
            }
        } catch (Exception e) {
            System.out.println("Error");
            System.out.println(e.toString());
        } finally {
            webDriver.quit();
        }
    }
}