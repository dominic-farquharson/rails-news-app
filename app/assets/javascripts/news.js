document.addEventListener('DOMContentLoaded', function() {
  const articles = document.querySelectorAll('.article-title');
  articles.forEach(el => el.addEventListener('click', openArticle));
  
  function openArticle(e) {
    window.open(this.dataset.url)
  }
});

