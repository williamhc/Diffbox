module NavLinkHelper
  def scoped_path path
    #just truncate everything off before the last /
    path.split('/')[-1]
  end
end
