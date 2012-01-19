# coding: utf-8
from peewee import *
import datetime

DB_NAME = 'storage.db'
db = SqliteDatabase(DB_NAME)
db.connect()

class BaseModel(Model):
    class Meta:
        database = db


class Tag(BaseModel):
    name = CharField(unique=True, db_index=True)

    def get_bookmarks(self):
        return BookMark.select().join(
                TagsOfBookmarks, on='bookmark_id'
        ).where(tag=self).order_by('touch_time')


class BookMark(BaseModel):
    url = CharField(unique=True)
    title = CharField()
    desc = TextField()
    touch_time = DateTimeField()

    def get_tags(self):
        return Tag.select().join(
                TagsOfBookmarks, on='tag_id'
        ).where(bookmark=self).order_by('name')


class TagsOfBookmarks(BaseModel):
    tag = ForeignKeyField(Tag)
    bookmark = ForeignKeyField(BookMark)


def create_tables():
    BookMark.create_table()
    Tag.create_table()
    TagsOfBookmarks.create_table()


