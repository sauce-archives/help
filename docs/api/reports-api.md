---
title: Reports REST API
layout: en
permalink: docs/api/reports/
---

<h4>Session History Reports</h4>

The session reports provide information about user sessions since the last 30 days. This includes user name , device usage and test reports.
If the authenticated user is the owner of the account, he will receive all session reports from his team. Sub users can only retrieve their own session history.

<h5>Endpoint:</5>


 {% highlight javascript %}
    https://app.testobject.com/rest/v1/users/{:userId}/session/reports
 {% endhighlight %}

<h5>Parameters:</h5>

| Parameter&nbsp; | Default Value&nbsp; | Description&nbsp; | Parameter Type&nbsp; | Data Type&nbsp; |
|-----------|---------------|:------------|----------------|-----------|
| userId |  | Your user name. | path | string |
| offset | 1 | Offset for pagination. | query | long | 
| limit | 50 | Max number of results per page. | query | integer |
| lastDays | 30 | Number of last days to report. | query | integer |

<h5> Response:</h5>

{% highlight javascript %}
{
  "entities": [
    {
      "id": string,
      "projectId": string,
      "userId": string,
      "deviceDescriptorId": string,
      "usage": string,
      "appId": string,
      "frameworkAppId": integer,
      "testFrameworkType": "string",
      "testFrameworkVersion": "string",
      "testReportIds": [
        integer
      ],
      "testIds": [
        integer
      ],
      "batchId": integer,
      "startDateTime": {},
      "endDateTime": {},
      "durationInSeconds": 0
    }
  ],
  "metaData": {
    "offset": integer,
    "limit": integer,
    "searchTerm": "string",
    "sortDirection": "DESCENDING",
    "count": integer
  }
}
{% endhighlight %}

<h5>Basic Authentication</h5>

This REST endpoint can be accessed by basic authentication:

{% highlight javascript %}
username={:yourUsername}
password={:yourPassword}
{% endhighlight %}

<h5>Curl Example </h5>

You can try the API using the following command:

{% highlight bash %}
curl --user {yourUsername}:{yourPassword} -i -H "Accept: application/json" -X GET https://app.testobject.com/rest/v1/users/{yourUsername}/session/reports?offset=1&limit=50&lastDays=30
{% endhighlight %}

<h5>Sample output:</h5>
{% highlight javascript %}

{
    "entities":
    [
       {
            "id": "c92d6a85-f939-445d-9841-947af25c05a4",
            "projectId": "calculator-0223",
            "userId": "foobar",
            "deviceDescriptorId": "Dell_Venue_8_real",
            "usage": "APPIUM",
            "appId": 1,
            "frameworkAppId": 0,
            "testFrameworkType": "APPIUM",
            "testFrameworkVersion": "1.4.8",
            "testReportIds":
            [
                78
            ],
            "testIds":
            [
                -1
            ],
            "batchId": -1,
            "startDateTime":
            {
                "second": 57,
                "hour": 10,
                "minute": 53,
                "nano": 0,
                "dayOfYear": 84,
                "dayOfWeek": "THURSDAY",
                "month": "MARCH",
                "dayOfMonth": 24,
                "year": 2016,
                "monthValue": 3,
                "chronology":
                {
                    "calendarType": "iso8601",
                    "id": "ISO"
                }
            },
            "endDateTime":
            {
                "second": 44,
                "hour": 10,
                "minute": 55,
                "nano": 0,
                "dayOfYear": 84,
                "dayOfWeek": "THURSDAY",
                "month": "MARCH",
                "dayOfMonth": 24,
                "year": 2016,
                "monthValue": 3,
                "chronology":
                {
                    "calendarType": "iso8601",
                    "id": "ISO"
                }
            },
            "durationInSeconds": 107
        }
    ],
    "metaData":
    {
        "offset": 1,
        "limit": 10,
        "searchTerm": null,
        "sortDirection": "DESCENDING",
        "count": 161
    }
} 
{% endhighlight %}


