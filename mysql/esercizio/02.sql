CREATE INDEX k_comments_status
  ON comments (`status`);

CREATE INDEX k_terms_taxonomy
  ON terms (taxonomy);
  
CREATE INDEX k_terms_slug
  ON terms (slug);

CREATE FULLTEXT INDEX ft_title_content
  ON posts (title, content);