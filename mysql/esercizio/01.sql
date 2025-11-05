create database Blog;
create user 'app_blog'@'localhost' identified by 'blog2025!';
grant all
on blog.*
to 'app_blog'@'localhost';

use blog;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20),
    cognome VARCHAR(30),
    username VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    `password` VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    slug VARCHAR(255) NOT NULL UNIQUE,
    excerpt TEXT,
    content TEXT NOT NULL,
    post_type VARCHAR(20) NOT NULL DEFAULT 'post',
    author_id INT NOT NULL,
		CONSTRAINT fk_posts_users FOREIGN KEY (author_id) REFERENCES users(id)
			ON DELETE CASCADE
			ON UPDATE CASCADE,
    `status` ENUM('draft', 'published', 'private', 'trash') DEFAULT 'draft',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE comments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  post_id INT NOT NULL,
  user_id INT,
  parent_comment_id INT,
  author_name VARCHAR(100),
  author_email VARCHAR(100),
  content TEXT NOT NULL,
  `status` ENUM('approved', 'pending', 'spam', 'trash') DEFAULT 'pending',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  -- Chiave esterna verso posts
  CONSTRAINT fk_comments_posts
    FOREIGN KEY (post_id)
    REFERENCES posts(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,

  -- Chiave esterna verso users
  CONSTRAINT fk_comments_users
    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE SET NULL
    ON UPDATE CASCADE,

  -- Self-reference per i commenti annidati
  CONSTRAINT fk_comments_parent
    FOREIGN KEY (parent_comment_id)
    REFERENCES comments(id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

CREATE TABLE terms (
  id INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  slug VARCHAR(255) NOT NULL UNIQUE,
  `description` TEXT,
  taxonomy VARCHAR(100) NOT NULL,
  parent_term_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  -- Self reference per la gerarchia dei termini
  CONSTRAINT fk_terms_parent
    FOREIGN KEY (parent_term_id)
    REFERENCES terms(id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

CREATE TABLE term_relationships (
  relationship_id INT AUTO_INCREMENT PRIMARY KEY,
  term_id INT NOT NULL,
  object_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  -- Foreign key verso la tabella terms
  CONSTRAINT fk_term_rel_term
    FOREIGN KEY (term_id)
    REFERENCES terms(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,

  -- Foreign key verso la tabella posts
  CONSTRAINT fk_term_rel_post
    FOREIGN KEY (object_id)
    REFERENCES posts(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

ALTER TABLE users
  CHANGE COLUMN nome first_name VARCHAR(100) NOT NULL;

ALTER TABLE users
  CHANGE COLUMN cognome last_name VARCHAR(100) NOT NULL;

ALTER TABLE posts
  ADD COLUMN featured_image VARCHAR(255) NULL
  AFTER `status`;