# Инструкция по настройке и запуску проекта ST-7

## Требования

1. **Java Development Kit (JDK)** версии 11 или выше
2. **Apache Maven** (установить и добавить в PATH)
3. **Google Chrome** последних версий
4. **ChromeDriver** - версия, соответствующая установленной версии браузера

## Настройка

### Шаг 1: Установка ChromeDriver

1. Узнайте версию вашего браузера Google Chrome (Меню → Справка → О браузере Google Chrome)
2. Перейдите на страницу [Chrome for Testing availability](https://googlechromelabs.github.io/chrome-for-testing/)
3. Скачайте версию ChromeDriver, соответствующую вашей версии браузера
4. Распакуйте архив и запомните путь к исполняемому файлу `chromedriver.exe`

### Шаг 2: Настройка пути к драйверу

Откройте следующие файлы и замените путь к драйверу на актуальный:

- `src/main/java/ru/unn/st7/App.java` (строка 19)
- `src/main/java/ru/unn/st7/Task2.java` (строка 12)
- `src/main/java/ru/unn/st7/Task3.java` (строка 16)

Замените:
```java
System.setProperty("webdriver.chrome.driver", "C:\\path\\to\\chromedriver.exe");
```

На пример:
```java
System.setProperty("webdriver.chrome.driver", "C:\\Users\\User\\Downloads\\chromedriver-win64\\chromedriver.exe");
```

### Шаг 3: Сборка проекта

Откройте терминал в директории проекта и выполните:

```bash
mvn clean compile
```

### Шаг 4: Запуск проекта

Для запуска всех заданий выполните:

```bash
mvn exec:java -Dexec.mainClass="ru.unn.st7.App"
```

Или запустите отдельные задания:

```bash
# Задание 1 (Генератор паролей)
mvn exec:java -Dexec.mainClass="ru.unn.st7.App"

# Задание 2 (Получение IP-адреса)
mvn exec:java -Dexec.mainClass="ru.unn.st7.Task2"

# Задание 3 (Прогноз погоды)
mvn exec:java -Dexec.mainClass="ru.unn.st7.Task3"
```

## Результаты

После выполнения программы:
- В консоли будут выведены результаты всех трёх заданий
- Прогноз погоды будет сохранён в файл `result/forecast.txt`

## Структура проекта

```
ST-7/
├── pom.xml                          # Конфигурация Maven
├── src/
│   ├── main/
│   │   └── java/ru/unn/st7/
│   │       ├── App.java             # Основное приложение (Задание 1 + вызов 2 и 3)
│   │       ├── Task2.java           # Задание 2: Получение IP-адреса
│   │       └── Task3.java           # Задание 3: Прогноз погоды
│   └── test/
│       └── java/ru/unn/st7/
│           └── AppTest.java         # Тесты
└── result/
    └── forecast.txt                 # Результат прогноза погоды
```

## Примечания

- При запуске будет автоматически открыто окно браузера Chrome
- Убедитесь, что у вас есть стабильное интернет-соединение
- Если возникают ошибки, проверьте правильность пути к ChromeDriver