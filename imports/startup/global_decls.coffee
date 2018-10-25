import React, { Component } from 'react'
import { observable, toJS, reaction } from 'mobx'
import { observer } from 'mobx-react'
import Meteor, { withTracker } from 'react-native-meteor'
import PropTypes from 'prop-types'
import _ from 'lodash'
import uuid from 'uuid/v1'
import moment from 'moment'

global.React = React
global.Component = Component
global.observable = observable
global.toJs = toJS
global.reaction = reaction
global.observer = observer
global.withTracker = withTracker
global.Meteor = Meteor
global.PropTypes = PropTypes
global._ = _
global.uuid = uuid
global.moment = moment
