$(document).on('turbolinks:load', function() {
  const $modal = $('#create-bookmark')

  $modal.on('show.bs.modal', function (event) {
    const button = $(event.relatedTarget) // trigger modal
    const key = button.data('article-key') 
  
    const modal = $(this);
    const $article = $(`#article-${key}`); // grab article key
    const href = $article.data('url'); // grab url

    window.modal = modal;
    console.log(modal, $article.attr('title'), href, 'submitted')
    
    modal.find('#bookmark_link').text(href); // set placeholder
    modal.find('#bookmark_title').val($article.attr('title')); // set placeholder
    $('#bookmark_link_val').val(href); // set val of hidden input
  })


  const bookmarks = document.querySelectorAll('.bookmark-title');
  bookmarks.forEach(el => el.addEventListener('click', openArticle));
    
  function openArticle(e) {
    window.open(this.dataset.url)
  }

  // create bookmark
  $('.create-bookmark-btn').on('click', (e) => {
    const title = $('#bookmark_title');
    const link = $('#bookmark_link');

    if(!title.val() || !link.text()) {
      alert('A title and link is required');
      return;
    }


    const data = $('#create-bookmark-form').serialize();

    $.ajax({
      url: '/bookmarks',
      type: 'POST',
      data,
      success: response => {
        if(response.success) {
          document.getElementById('create-bookmark-form').reset();
          // close modal
          $modal.modal('hide');
          // window.location.href = '/bookmarks';
        }
        
        
      },
      error: (error) => {
        console.log('error ', ...arguments)
        alert('error saving bookmark. please try again')
      }
    });
  });
});