# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import scrapy


class JobuiItem(scrapy.Item):
    # define the fields for your item here like:
    company=scrapy.Field()
    name = scrapy.Field()
    position=scrapy.Field()
    job_position_info=scrapy.Field()
    info=scrapy.Field()
    pass

