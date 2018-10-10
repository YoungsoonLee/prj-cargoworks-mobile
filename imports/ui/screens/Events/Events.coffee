import EventsView from './EventsView.coffee'
import withHandler from './withHandler.coffee'

export default Events = withFind('events') withHandler EventsView
