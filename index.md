LWKD is a weekly newsletter summarizing code activity in the Kubernetes project: merges, PRs, deprecations, version updates, release schedules, and the weekly community meeting.  It does not cover events or news in the Kubernetes ecosystem, as our sister publication [KubeWeekly](http://bit.ly/kubeweekly) does a great job of handling those.

LWKD is the product of [contributors from the Kubernetes Project](/authors).  It is not an official publication of the CNCF or the project.  If you're interested in helping with LWKD, see our [README](https://github.com/lwkd/lwkd.github.io).  You can also contact us at lwkd@lwkd.info.

[Subscribe](http://eepurl.com/dkBy_j) to receive LWKD by email, or [follow us on Twitter](https://twitter.com/LWKDNews) or on our [RSS feed](/feed.xml)

{% for post in site.posts limit: 25 %}
  {% assign currentdate = post.date | date: "%Y" %}
  {% if currentdate != date %}
<h1 id="y{{post.date | date: "%Y"}}">Weekly Updates for {{ currentdate }}</h1>
    {% assign date = currentdate %}
  {% endif %}
<p><a href="{{ post.url }}">{{ post.title }}</a></p>
{% endfor %}

# Privacy Notice

LWKD collects web browsing data, including IP address, using Google Analytics cookies for popularity and success statistics.  This data is not shared by LWKD with any other parties, and expires automatically after 26 months.  To remove or examine your data, please [contact Google](https://privacy.google.com/businesses/compliance).  If you subscribe to LWKD by email, we also collect email information for tracking and delivery purposes.  You can ask for this to be removed by [contacting us](mailto:lwkd@lwkd.info).
