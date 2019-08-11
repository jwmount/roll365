
class App < HyperComponent
  include Hyperstack::Router

  render(SECTION, class: 'roll365-app' ) do
    Header()
    Route('/', exact: true) {Redirect('dashboard/all') }
    Route('/dashboard', exact: true) { Redirect('/dashboard/all') }
#    Route('/dashboard/:scope', mounts: Dashboard)   # scopes are :ontime, :delayed, :completed  was Index
    Footer()
  end
end
