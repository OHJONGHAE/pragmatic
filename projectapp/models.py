from django.contrib.auth.models import User
from django.db import models

# Create your models here.


class Project(models.Model):

    project_writer = models.ForeignKey(User, on_delete = models.CASCADE, related_name='project', default="")

    image = models.ImageField(upload_to = 'project/', null=False)
    title = models.CharField(max_length= 20, null=False)
    description = models.CharField(max_length= 200,null=True)

    create_at = models.DateField(auto_now_add=True, null=True)


    def __str__(self):
        return f'{self.pk} : {self.title}'

