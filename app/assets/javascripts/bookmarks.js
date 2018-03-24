$(function() {
  
  const $bookmarks = $('.bookmark');
  $bookmarks.each(function() {
    const $bookmark = $(this);
    $bookmark.on('click', function() {
      const key = $bookmark.data('article-key');
      const href = $(`#article-${key}`).data('url');
    });
  });


  function toggleModal() {
    
  }

});