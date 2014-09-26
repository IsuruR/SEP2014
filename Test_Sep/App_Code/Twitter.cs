using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using Newtonsoft.Json.Linq;
using TweetSharp;

/// <summary>
/// Summary description for Twitter
/// </summary>
public class Twitter
{
	public Twitter()
	{
		
	}

    public void scrapeData()
    {
        // oauth application keys
            var oauth_token = "159123624-pONPALYjU62x3zTFlTPMcHNiXo5AhwelceWaZ4Hx";
            var oauth_token_secret = "jRLOeSemJmnUgMYtLe3ICOoaeCGfH4BBpVe6LnyqgyrxN";
            var oauth_consumer_key = "NQWhahbosUr4cAdfJozV2l0VC";
            var oauth_consumer_secret = "mGYpbYQpdMOSF6MwYQPKAIn22KfhjCAMxnZXL4ix8dAzLb5qsr";

            // oauth implementation details
            var oauth_version = "1.0";
            var oauth_signature_method = "HMAC-SHA1";

            // unique request details
            var oauth_nonce = Convert.ToBase64String(
                new ASCIIEncoding().GetBytes(DateTime.Now.Ticks.ToString()));
            var timeSpan = DateTime.UtcNow
                - new DateTime(1970, 1, 1, 0, 0, 0, 0, DateTimeKind.Utc);
            var oauth_timestamp = Convert.ToInt64(timeSpan.TotalSeconds).ToString();

            // message api details
            //var status = "Updating status via REST API 1.1";
            var resource_url = "https://api.twitter.com/1.1/followers/list.json";

            // create oauth signature
            var baseFormat = "oauth_consumer_key={0}&oauth_nonce={1}&oauth_signature_method={2}" +
                            "&oauth_timestamp={3}&oauth_token={4}&oauth_version={5}";

            var baseString = string.Format(baseFormat,
                                        oauth_consumer_key,
                                        oauth_nonce,
                                        oauth_signature_method,
                                        oauth_timestamp,
                                        oauth_token,
                                        oauth_version
                //,Uri.EscapeDataString(status)
                                        );

            baseString = string.Concat("GET&", Uri.EscapeDataString(resource_url), "&", Uri.EscapeDataString(baseString));

            var compositeKey = string.Concat(Uri.EscapeDataString(oauth_consumer_secret),
                                    "&", Uri.EscapeDataString(oauth_token_secret));

            string oauth_signature;
            using (HMACSHA1 hasher = new HMACSHA1(ASCIIEncoding.ASCII.GetBytes(compositeKey)))
            {
                oauth_signature = Convert.ToBase64String(
                    hasher.ComputeHash(ASCIIEncoding.ASCII.GetBytes(baseString)));
            }

            // create the request header
            var headerFormat = "OAuth oauth_nonce=\"{0}\", oauth_signature_method=\"{1}\", " +
                               "oauth_timestamp=\"{2}\", oauth_consumer_key=\"{3}\", " +
                               "oauth_token=\"{4}\", oauth_signature=\"{5}\", " +
                               "oauth_version=\"{6}\"";

            var authHeader = string.Format(headerFormat,
                                    Uri.EscapeDataString(oauth_nonce),
                                    Uri.EscapeDataString(oauth_signature_method),
                                    Uri.EscapeDataString(oauth_timestamp),
                                    Uri.EscapeDataString(oauth_consumer_key),
                                    Uri.EscapeDataString(oauth_token),
                                    Uri.EscapeDataString(oauth_signature),
                                    Uri.EscapeDataString(oauth_version)
                            );


            // make the request
            // var postBody = "status=" + Uri.EscapeDataString(status);

            ServicePointManager.Expect100Continue = false;
           
            var cursor = 3;

            do
            {
                //var url_with_cursor = resource_url + "&cursor=" + 1463101490306580067;
                //Response.Write(url_with_cursor);
                //var api_path = "https://api.twitter.com/1.1/endpoint.json?screen_name=isu_senanayake";
 
                //var url_with_cursor = api_path + "&cursor=" + cursor;      

                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(resource_url);
                request.Headers.Add("Authorization", authHeader);
                request.Method = "GET";
                request.ContentType = "application/x-www-form-urlencoded";
                //using (Stream stream = request.GetRequestStream())
                //{
                //    byte[] content = ASCIIEncoding.ASCII.GetBytes(postBody);
                //    stream.Write(content, 0, content.Length);
                //}
                WebResponse response = request.GetResponse();

                

                string result = new StreamReader(response.GetResponseStream()).ReadToEnd();
                JObject j = JObject.Parse(result);
                JArray data = (JArray)j["users"];
                //cursor = (int)j["next_cursor"];
                int totalFollowers = (data).Count;
                //lblTotalFollowers.Text = "isu_senanayake has " + (data).Count + " Followers";

                //Response.Write(result);

                if (data != null)
                {
                    List<TwiterFollowers> listFollowers = new List<TwiterFollowers>();
                    foreach (var item in data)
                    {
                        TwiterFollowers objTwiterFollowers = new TwiterFollowers();
                        objTwiterFollowers.ScreenName = item["screen_name"].ToString().Replace("\"", "");
                        objTwiterFollowers.ProfileImage = item["profile_image_url"].ToString().Replace("\"", "");
                        objTwiterFollowers.UserId = item["id"].ToString().Replace("\"", "");
                        objTwiterFollowers.Location = item["location"].ToString().Replace("\"", "");
                        listFollowers.Add(objTwiterFollowers);
                    }


                    Random objRnd = new Random();
                    List<TwiterFollowers> rendomFollowers = listFollowers.OrderBy(item => objRnd.Next()).ToList<TwiterFollowers>();
                    //for (int i = 0; i <= 9; i++)
                    //{
                    //    strTwiterFollowers = strTwiterFollowers + "<li><a target='_blank' title='" + rendomFollowers[i].Location + "' href=https://twitter.com/" + rendomFollowers[i].ScreenName + "><img src='" + rendomFollowers[i].ProfileImage + "'/><span>" + rendomFollowers[i].ScreenName + "</span></a></li>";

                    //}

                }

                //Response.Write(j["next_cursor"]);
                //cursor = (int)j["next_cursor"];
                //Response.Write("Cursor : " + cursor);
                cursor = cursor - 1;

            } while (cursor != 0);

            //Response.Write(result);

        }

        public class TwiterFollowers
        {
            public string ScreenName { get; set; }
            public string ProfileImage { get; set; }
            public string UserId { get; set; }
            public string Location { get; set; }
        }

}