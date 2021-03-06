# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

SpaceTime.delete_all  # rake db:seed creates a clean board.

require_relative 'time_span'
require_relative 'room_sessions'
require_relative 'unavailable_rooms'

RoomSessions.from_array( [
    # Day, Session id, start, end, (location_of_exclusive, exclusive_flag)
    [ 0, 'Welcome Barbeque', '6:00 PM', '11:00 PM', "Bruce's House", :exclusive],
    [ 1, 'Introduction', '8:30', '9:00', 'PH Stained Glass', :exclusive],
    [ 1, 'Session 1', '9:00', '10:00' ],
    [ 1, 'Session 2', '10:30', '11:30' ],
    [ 1, 'Workshop 1', '2:00 PM', '5:30 PM' ],
    [ 1, 'Lightning Talks', '7:30 PM', '9:00 PM', 'PH Stained Glass', :exclusive],
    [ 1, 'Pub Discussions', '9:00 PM', '12:00 PM', 'Town Pubs', :exclusive],
    [ 2, 'Session 3', '8:30', '9:30' ],
    [ 2, 'Session 4', '10:00', '11:00' ],
    [ 2, 'Session 5', '11:30', '12:30' ],
    [ 2, 'Workshop 2', '2:00 PM', '5:30 PM' ],
    [ 2, 'Lightning Talks', '7:30 PM', '9:00 PM', 'PH Stained Glass', :exclusive],
    [ 2, 'Pub Discussions', '9:00 PM', '12:00 PM', 'Town Pubs', :exclusive],
    [ 3, 'Hackathon', '9:00', '5:30 PM' ],
    [ 3, 'Hackathon Showcase Lightning Talks', '7:30 PM', '9:00 PM', 'PH Stained Glass', :exclusive],
    [ 3, 'Pub Discussions', '9:00 PM', '12:00 PM', 'Town Pubs', :exclusive],
    [ 4, 'Session 6', '8:30', '9:30' ],
    [ 4, 'Session 7', '10:00', '11:00' ],
    [ 4, 'Session 8', '11:30', '12:30' ],
    [ 4, 'Workshop 3', '2:00 PM', '5:30 PM' ],
    [ 4, 'Progressive Dinner', '5:30 PM', '8:00 PM', 'Rental Houses', :exclusive],
    [ 4, 'Live JavaPosse recording and Conference Feedback', '8:00 PM', '9:30 PM', 'PH Downstairs', :exclusive],
    [ 4, 'Karaoke', '9:30 PM', '12:00 PM', 'Location TBA', :exclusive],
    [ 5, 'Session 9', '8:30', '9:30' ],
    [ 5, 'Session 10', '10:00', '11:00' ],
    [ 5, 'Session 11', '11:30', '12:30' ],
    [ 5, 'Workshop 4', '2:00 PM', '5:30 PM' ],
    [ 5, "Dinner", '6:00 PM', '10:00 PM', "Django's or Yurt", :exclusive],
    [ 6, 'Breakfast', '8:30', '1:00 PM', "Bruce's House", :exclusive],
] )

UnavailableRooms.from_array( [
   # Room                 day   start       end
   ['PH Downstairs',       1, '3:45 PM', '6:00 PM'], # Hebrew
   ['PH Downstairs',       3, '3:30 PM', '7:00 PM'], # Religious education
   ['PH Stained Glass',    3, '3:30 PM', '7:00 PM'], # Religious education
   ['PH Piano',            3, '3:30 PM', '7:00 PM'], # Religious education
   ['PH Downstairs',       2, '5:00 PM', '9:00 PM'], # Prayer Group/Bible Class
   ['PH Downstairs',       5, '7:00 AM', '9:00 AM'], # Men's Group
] )

RoomSessions.exclude(UnavailableRooms)
# RoomSessions.sessions.each { |s| p s}
# UnavailableRooms.rooms.each { |r| p r }
RoomSessions.generate_spacetimes
