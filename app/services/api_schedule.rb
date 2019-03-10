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
          appkey: "40635",
          sign: "2bb72d4a52ce6888eb622a850c18de2b",
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
