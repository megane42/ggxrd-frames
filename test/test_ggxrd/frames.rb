# coding: utf-8
require 'minitest_helper'

class TestGGXrdFrames < Minitest::Test
  
  def test_that_it_has_a_version_number
    refute_nil ::GGXrd::Frames::VERSION
  end

  
  def test_it_returns_a_frame_data_as_hash
    stub_html = File.read(File.expand_path('../stub.html', __FILE__)).freeze
    stub_request(:any, %r{www.4gamer.net/guide/ggxrd/.*}).
      to_return(status: 200, headers: {content_type: 'text/html'}, body: stub_html)

    data = GGXrd::Frames::frame_of('SO')
    
    assert_equal data[14]['name']          , '6＋P'
    assert_equal data[14]['damage']        , '32'
    assert_equal data[14]['tension']       , '264'
    assert_equal data[14]['attack_lv']     , '2'
    assert_equal data[14]['risc_lv']       , '-12 / +10'
    assert_equal data[14]['prorate']       , '―'
    assert_equal data[14]['attribute']     , '上'
    assert_equal data[14]['startup']       , '9'
    assert_equal data[14]['active']        , '3'
    assert_equal data[14]['recovery']      , '20'
    assert_equal data[14]['frame_adv']     , '- 9'
    assert_equal data[14]['invincibility'] , '1～7・12～19上半身，8～11膝上'
    assert_equal data[14]['remarks']       , ''
  end
  
  
  def test_it_returns_nil_when_it_fails_to_fetch_data
    stub_request(:any, %r{www.4gamer.net/guide/ggxrd/.*}).
      to_return(status: 404, headers: {content_type: 'text/html'})
    
    assert_nil GGXrd::Frames::frame_of('SO')
  end

end
