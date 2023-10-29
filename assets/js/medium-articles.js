// assets/js/medium-articles.js

$(document).ready(function () {
    const mediumUsername = '@nipunthilakshan';
  
    // Adjust the number of articles based on your needs
    const numberOfArticles = 9;
  
    const fetchArticle = function (articleIndex) {
      const apiUrl = `https://github-readme-medium-recent-article.vercel.app/medium/${mediumUsername}/${articleIndex}`;
  
      $.get(apiUrl, function (data) {
        if (data.success) {
          const article = data.article;
          const articleHtml = `<article>
            <h2>${article.title}</h2>
            <p>${article.description}</p>
            <a href="${article.link}" target="_blank" rel="noopener noreferrer">Read on Medium</a>
          </article>`;
  
          $('#medium-articles').append(articleHtml);
  
          // Fetch the next article
          fetchArticle(articleIndex + 1);
        } else {
          // Stop fetching if there's an error or no more articles
          console.error('Error loading Medium article:', data.error);
        }
      });
    };
  
    // Start fetching articles from index 1
    fetchArticle(1);
  });
  