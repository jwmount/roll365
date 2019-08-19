class App < HyperComponent
  include Hyperstack::Router
  history :browser

  # Note that the rails routes.rb file only mounts this component
  # IF none of the oldschool rails routes match
  render(DIV) do

     # if we are mounting /dashboard without ANY scope then redirect to dashboard/all
     # i.e. /dashboard/all is the default
     Route( '/dashboard', exact: true) { Redirect('/dashboard/all') }
     # otherwise match the scope (it will be accessible via the `match` method)
     Route( '/dashboard/:scope', mounts: Dashboard)
     # Note that you could mount other parts of the project here as well:  i.e. Route('/random'), mounts: Random) ...
  end
end
