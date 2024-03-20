module Resolvers
  class QueryResolver
    def blogs
      Blog.all
    end
  end
end