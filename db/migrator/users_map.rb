class UsersMap
  @users = {
      '会拉射的大菜鸡'       => 'joey.lin',
      '乌龙 Master 纹身特' => 'vincent.cai',
      '铃盛纹身特'         => 'vincent.cai',
      'yeoman'        => 'yeoman.cai',
      'stevechen'     => 'steve.chen',
      'SamuelHuang'   => 'samuel.huang',
      'NasenYou'      => 'nasen.you',
      'LipWang'       => 'lip.wang',
      'lwei.li'       => 'lewi.li',
      'kingle.zhuang' => 'kingle.zhuang',
      'josie.zhang'   => 'josie.zhang',
      'jerry.cai'     => 'jerry.cai',
      'JacobJiang'    => 'jacob.jiang',
      'IanZhang'      => 'ian.zhang',
      'holly.wu'      => 'holly.wu',
      'EthanChen'     => 'ethan.chen',
      'embbnux'       => 'embbnux.ji',
      'Corgi123'      => 'ned.le',
      'amberlin'      => 'amber.lin',
      'allenlian'     => 'allen.lian',
      'tony.lin'      => 'tony.lin',
      'albert.gu'     => 'albert.gu',
      'weil.wu'       => 'weil.wu'
  }

  def self.get(name)
    if @users.has_key?(name)
      @users.fetch(name)
    end
  end
end