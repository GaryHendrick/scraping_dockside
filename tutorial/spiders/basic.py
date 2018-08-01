import scrapy
from scrapy.http.request import Request


class BasicSpider(scrapy.Spider):
    name = "quotes"

    def start_requests(self):
        urls = [
            'http://quotes.toscrape.com/page/1/',
            'http://quotes.toscrape.com/page/2/',
        ]
        for url in urls:
            yield scrapy.Request(url=url, callback=self.parse)

    def parse(self, response: Request):
        self.log('parsed file %s' % response.url)

        
class DemonstrationSpider(scrapy.Spider):
    ''' The DemonstrationSpider is a sample spider intended for nothing more than showing and example of the spider
    lifecycle.  For a full description click [here](https://doc.scrapy.org/en/latest/topics/spiders.html)

    '''
    # the name to be shown at any given point for this spider
    name = "demonstration"

    # start urls are used by the start_requests method's default implementation, in this demostration it is overridden
    start_urls = [
        'http://foo.bar.baz'
    ]

    # custom_settings a dict of settings which are overridden for this spider
    custom_settings = {
        'CONCURRENT_REQUESTS_PER_DOMAIN': 1
    }

    # allowed domains will restrict the spider as expected
    allowed_domains = ['toscrape.com']

    def __init__(self, category=None, *args, **kwargs):
        super(DemonstrationSpider, self).__init__(*args, **kwargs)
        self.logger.setLevel(logging.INFO)

    def start_requests(self):
        ''' The start_requests method is invoked and creates a generator for Request objects, to be passed to
         the parse method.  This method need not be implemented if the start_urls field provides enough functionality
         for the parse method to operate effectively. '''
        self.logger.info("invocation of the start_request method")
        urls = [
            'http://quotes.toscrape.com/'
        ]
        for url in urls:
            yield scrapy.Request(url=url, callback=self.parse)

    def parse(self, response: Response):
        ''' The parse method is invoked as a callback called for each request generated in the start_requests generator.
        This is where we parse the response to the request and extract data.  Return dicts containing extracted Item
        objects, or more Request objects to continue a recursive search'''
        self.logger.info("parsing response %s", response)
