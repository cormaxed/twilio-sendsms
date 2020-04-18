#twilio-sendsms

A command-line tool for sending bulk sms using Twilio.

The utility allows you define mustache template and provide a CSV file with matching columns for bulk sms sends.

## Installation

The utility requires `python3.7`

```
python -m pip install twilio_sendsms
```

## Setup

The first time you run, you will get prompted to provide your Twilio account details.

All configuration settings get stored in `~/.twilio-sendsms.config`. To reconfigure you can delete this file. 

## Running 

First you need to define a mustach template and save to a file e.g. example.mustache:

```
Hi {{first_name}}, this is a test SMS. 
```

Next you need to create a buld send CSV file. The file must have a `mobile_number` column. The mobile number must be in international format e.g. +614XXXXXXXX. The other columns names need to match the variable names used in the mustache template.

buld_send.csv
```
"mobile_number","first_name"
"+61405803106","Joe"
```

To process the batch file:

```
sendsms --template example.mustache test.csv 
```

## Testing

Before processing a bulk CVS file it's a good idea to sample some entries and send them to yourself first. This lets you confirm the formatting and check via the Twilio that the number of segments and costs are as expected.

To sample and override the mobile_number in the CSV file:

```
sendsms --template example.mustache --sample 1 --sendto +614XXXXXXXX test.csv
```

The command outputs destination mobile number, the Twilio message identifier and the SMS message sent.

```
+614XXXXXXXX,SM8c6335fdcffe4bb88313a16fabc9234d,Hi Joe, this is a test SMS. 
```
