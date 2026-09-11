# Peer ownership of books

Books form a shared catalog, but every Book has one or more peer Book owners (a junction set, no "creator" role). Creating a Book makes its creator an owner; any owner can add or remove other owners, and only owners may edit or delete. The obvious simple alternative — any authenticated user may edit any Book — was rejected because the ownership concept is a graded requirement, and the creator-hierarchy alternative was rejected because it adds a distinction the semantics don't need. A single-`OwnerId` column cannot express the multi-owner requirement this settles on.
