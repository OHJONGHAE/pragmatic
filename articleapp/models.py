from django.contrib.auth.models import User
from django.db import models

# Create your models here.


class Article(models.Model):
    # 회원탈퇴시 게시글이 없어지지 않고 알 수 없음
    writer = models.ForeignKey(User, on_delete = models.SET_NULL, related_name='article', null=True)

    title = models.CharField(max_length = 200, null=True)
    image = models.ImageField(upload_to = 'article/', null=False)
    content = models.TextField(null=True)

    create_at = models.DateField(auto_now_add=True, null=True)
