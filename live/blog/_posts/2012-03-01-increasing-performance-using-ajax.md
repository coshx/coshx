---
layout: post
title: Increasing Performance using Ajax
author: calvin@coshx.com
---
In this post I’m going to show how to use Ajax to get JSON to decrease page load times and make your site scale better. This example assumes you're using Rails, but the idea applies elsewhere as well.

<h4>Scenario</h4> You have an expensive call in your controller - it's slow and/or database intensive. Also, the data you get from this call is not actually needed when the page loads because it's displayed after the user interacts with the site.

<h4>Example</h4> You have a chart that has multiple views and a large data set. You need the initial view when the page loads but don’t need the data for the other views until the user changes views. This is a good time to use Ajax to get the data that the chart needs on demand.
(Notice I said "on demand." You could get the data when the page is done loading if you think the user will often do whatever is needed to make it appear. However, always making the expensive data call when the page is done does not scale as well - why get the data if you don't need it?)
<br><br><br>
<h3>Code sample</h3>
Here is some sample code I hacked up to get the idea across (note there is some hand waving in the javascript for the charts- let me know if you have improvements/code fixes for the example)

<h4>Data</h4> (This is just a simple example for demonstration purposes, pretend these are expensive database calls)

```ruby
class Chart
  def self.get_daily_data
    [5, 4, 7, 6, 5, 4]
  end

  def self.get_bi_daily_data
    [12, 10, 6, 7, 8, 5, 4, 7, 6, 5, 4]
  end
end
```
<h4>Controller</h4>
from:

```ruby
def show
  @daily = Chart.get_daily_data
  @bi_daily = Chart.get_daily_data
end
```

to:

```ruby
def show
  @daily = Chart.get_daily_data
end
def bi_daily
  render :json => Chart.get_daily_data
end
```

<h4>View (using haml)</h4>
from:

```haml
#daily_data{:style => "display:none;"}
  = @daily_data
#bi_daily_data{:style => "display:none;"}
  = @bi_daily_data
```
to:

```haml
#daily_data{:style => "display:none;"}
  = @daily_data
#url{:style => "display:none;"}
  = request.url
```
<h4>Javascript (using jquery/coffee script)</h4>
from:

```javascript
dailyData = $.trim($("#daily_data").html())
biDailyData = $.trim($("#bi_data").html())
chart = createChart(dailyData, "daily")
addDataToChart(chart, biDailyData, "biDaily")

$("#show_daily").click ->
  chart.hide("biDaily")
  chart.show("daily")
$("#show_bi_daily").click ->
  chart.hide("daily")
  chart.show("biDaily")
```
to:

```javascript
dailyData = $.trim($("#daily_data").html())
chart = createChart(dailyData, "daily")

$("#show_daily").click ->
  chart.hide("biDaily")
  chart.show("daily")

$("#show_bi_daily").click ->
  loadBiDaily() if chart.doesntHaveDataSeries("biDaily)
  chart.hide("daily")
  chart.show("biDaily")

loadBiDaily ->
  url = $.trim($("#url").html())
  #if the following is really slow you could use a loading wheel from http://ajaxload.info/
  biDailyAjax = $.getJSON( url + "/bi_daily", (biDailyData) ->
  addDataToChart(chart, biDailyData, "biDaily")
```
