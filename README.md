# 🗑 Udine waste collection

This repository contains the code to run a bash script that sends you a Telegram message remembering to expose the correct waste bin for the following day city waste collection.

## Collection days

Following the [Udine collection calendar](https://netaziendapulita.it/comuni/udine) for the 2022, the city collections bappend in this days:

|             | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday |
| ----------- |:------:|:-------:|:---------:|:--------:|:------:|:--------:| ------ |
| **Circ. 1** | 🟤     | ⚫️⚪️    | 🟡 🔵     | 🟤       | 🟢     | ⚫️⚪️     |        |
| **Circ. 2** | 🟤⚪️   | 🔵      | 🟡        | ⚫️⚪️     | 🟤     | 🟢*      |        |
| **Circ. 3** | 🟤⚪️   | 🔵      | 🟡        | 🟤       | ⚫️⚪️   | 🟢*      |        |
| **Circ. 4** | 🟤⚪️   | 🔵      | 🟡        | ⚫️⚪️     | 🟤     | 🟢*      |        |
| **Circ. 5** | 🟤⚪️   | 🔵      | 🟡        | ⚫️⚪️     | 🟤     | 🟢*      |        |
| **Circ. 6** | 🟤⚪️   | 🔵      | 🟡        | ⚫️⚪️     | 🟤     | 🟢*      |        |
| **Circ. 7** | 🟤⚪️   | 🔵      | 🟡        | 🟤       | ⚫️⚪️   | 🟢*      |        |

where
* 🔵 represents the **paper packagings** collection;
* 🟡 represents the **plastic packagings** collection;
* 🟤 represents the **organic waste** collection;
* ⚫️ represents the **undifferentiate** collection;
* ⚪️ represents the **diapers** collection;
* 🟢 represents the **glass and jar** collection.

## Requirements

In order to successfully run the code, you only need `curl` installed on your system.

## Usage

#### 1. Clone this repository on your PC

First of all, [clone](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository) in you home folder (or wherever you like in your system) the project folder from the GitHub repository.

```bash
cd ~    # Navigate to the place where you want the project folder to be
git clone enstit/udine_wastecollection_reminder
```

#### 2. Create a Telegram bot

> **Note**
> If you don't know how to create a Telegram bot using [BotFather](https://t.me/botfather), read the [official guide](https://core.telegram.org/bots#6-botfather).

After creating the Telegram bot, save your `BOT_TOKEN` and `GROUP_ID`.


#### 3. Edit the configuration file

After [cloning this repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository), and once insite its directory, make your copy of the `config` file

```bash
cp config.ini.example config.ini
```

and edit it with your chosen values for the variables.

```bash
nano config.ini
```

##### Environment variables

* `NOTIFY_HOUR`: the hour of the day you want to receive the reminder notification, using the 24-hours format. Default value to `19`.

* `NOTIFY_MINUTE`: the minute of the `NOTIFY_HOUR` you want to receive the reminder notification. Default value to `00`.

* `BOT_TOKEN`: ...

#### 4. Add the script to crontab

Enter the crontab configuration file

```bash
echo "<MINUTE> <HOUR> * * * /bin/sh <PATH TO THE PROJECT FOLDER>/send_wastecollection_notify.sh" >> crontab
```

changin `MINUTE` to the minute of the `HOUR`, and `HOUR` to the 24-format hour you want to receive the notification. So for example, if you want to be notified each day at 7pm the day before the city collection, simply run

```bash
echo "00 19 * * * /bin/sh <PATH TO THE PROJECT FOLDER>/send_wastecollection_notify.sh" >> crontab
```

And you're done!
