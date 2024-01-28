-- [[ Racket ]]
-- Mason doesn't support racket_langserver so we're setting it up manually
-- Requires manual install
-- $ apt-get install racket
-- $ raco pkg install racket-langserver
require('lspconfig').racket_langserver.setup({})
