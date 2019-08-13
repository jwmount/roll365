
class App < HyperComponent
  include Hyperstack::Component
  #include Hyerstack::Router::Helpers  # gives us match, location, history,...
  include Hyperstack::Router

  history :browser

  #render(SECTION, class: 'roll365-app' ) do
  render(DIV) do

    Header()

    Route( '/dasboard', mounts: Dashboard) do
      dashboard()
    end
    Route( '/dashboard', exact: true) {Redirect('dashboard/all') }
    # FAILS with '/:scope', OK with 'dashboard/:scope', ...
    Route( '/dashboard/:scope', mounts: Dashboard)


#    Route( '/', mounts: Dashboard)   { Redirect('dashboard/all') }
#    Route( '/', exact: true )        { Redirect('dashboard/all') }
#    Route( '/dashboard', exact: true){ Redirect('dashboard/all') }

    # Unclear if useful?
#    Route('/dashboard/*others', mounts: Dashboard)

    Footer()

  end

end
