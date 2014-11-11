require 'test_helper'

class EventRendererTest < Test::Unit::TestCase
  def test_event_renderer_yield_proper_javascript_snippit_for_default_tracker
    er = GA::EventRenderer.new(GA::Event.new('send', 'something', 1, 2, 3), nil)
    assert_equal("ga('send','something',1,2,3);", er.to_s)
  end

  def test_event_renderer_yield_proper_javascript_snippit_for_custom_tracker
    er = GA::EventRenderer.new(GA::Event.new('send', 'something', 1, 2, 3), 't2')
    assert_equal("ga('t2.send','something',1,2,3);", er.to_s)
  end
  def test_event_renderer_yield_proper_javascript_snippit_for_custom_tracker_creation
    er = GA::EventRenderer.new(GA::Events::SetupAnalytics.new('TEST', {:name => 't2'}), 't2')
    assert_equal("ga('create','TEST',{\"cookieDomain\":\"auto\",\"name\":\"t2\"});", er.to_s)
  end
end
