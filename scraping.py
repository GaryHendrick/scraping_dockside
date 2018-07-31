from scrapy.crawler import CrawlerProcess
from scrapy.utils.project import get_project_settings
from tutorial.spiders.basic import BasicSpider

# TODO: inspect the constructor to see if you can add project settings
process = CrawlerProcess(get_project_settings())

if __name__ == "__main__":
    process.crawl(BasicSpider)
    process.start()
