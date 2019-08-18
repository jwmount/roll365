
class App < HyperComponent
  #include Hyperstack::Component
  #include Hyerstack::Router::Helpers  # gives us match, location, history,...
  include Hyperstack::Router

  history :browser

  # Note that the rails routes.rb file only mounts this component
  # IF the route matches /dashboard/....
  # ANYTHING else will go to the oldschool rails controllers and view logic

  render(DIV) do

    # if we are mounting /dashboard without ANY scope then redirect to dashboard/all
    # i.e. /dashboard/all is the default

    Route( '/dashboard', exact: true) { Redirect('dashboard/all') }

    # otherwise match the scope (it will be accessible via the `match` method)

    Route( '/dashboard/:scope', mounts: Dashboard)

  end

end
