
class App < HyperComponent
  include Hyperstack::Component
  include Hyperstack::Router::Helpers
  include Hyperstack::Router

#  render(SECTION, class: 'roll365-app' ) do
  render do
    Header()
    Route('/', exact: true) mounts: Dashboard ) #{Redirect('dashboard/all') }
  #  Route('/dashboard', exact: true) { Redirect('/dashboard/all') }
    Route('/dashboard', mounts: Dashboard)
    # Unclear if both of these next two are useful?
  #  Route('/dashboard/:*...', mounts: Dashboard)
  #  Route('/dashboard/:scope', mounts: Dashboard)   # scopes are :ontime, :delayed, :completed  was Index

    Footer()
  end
end
