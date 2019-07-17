
class App < HyperComponent
  include Hyperstack::Router
  render(SECTION, class: 'roll365-app') do #add class: todo-app

    Route('/', exact: true) {Redirect('/all') }
    Route('/:scope', mounts: Dashboard)   # scopes are :ontime, :delayed, :completed  was Index

  end
end

