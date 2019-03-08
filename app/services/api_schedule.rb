module ApiSchedule
  extend self

  def call_nowapi
    inxnos = "1012,1015,1020,1022,1111,1112,1114,1217,1241,1238,1237".split(",")
    inxnos.each do |no|
      resp = Typhoeus.post(
        "http://api.k780.com",
        body: {
          app: "finance.globalindex",
          #inxnos: "1012,1015,1020,1022,1111,1112,1114,1217,1241,1238,1237",
          inxids: no,
          appkey: "38871",
          sign: "1244e07a9067d25085e3d0d45e4acab0",
          format: "json"
        }
      )

      data = ActiveSupport::JSON.decode(resp.body)
      if data["success"] == "1"
        $redis.set(no, data["result"]["lists"][no].to_json)
      end
    end
  end
end
