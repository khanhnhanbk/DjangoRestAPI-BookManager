from django.db import models

# Create your models here.
class Book(models.Model):
    title = models.CharField(max_length=100)
    author = models.CharField(max_length=100)
    isbn = models.CharField(max_length=13)
    publisher = models.CharField(max_length=100)
    pub_date = models.DateField()
    description = models.TextField()

    def __str__(self):
        return self.title