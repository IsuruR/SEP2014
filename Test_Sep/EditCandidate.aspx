<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="EditCandidate.aspx.cs" Inherits="EditCandidate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width"/>

    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/main.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label runat="server" Text="Edit Candidates" Font-Bold="true" Font-Size="XX-Large" Font-Italic="true"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" HeaderStyle-HorizontalAlign="Left" Width="100%" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="contestantID" DataSourceID="CandidateSqlDataSource" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="contestantID" HeaderText="Contestant ID" ReadOnly="True" SortExpression="contestantID" />
            <asp:BoundField DataField="contestantName" HeaderText="Contestant Name" SortExpression="contestantName" />
            <asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="gender" />
            <asp:BoundField DataField="age" HeaderText="Age" SortExpression="age" />
            <asp:BoundField DataField="hometown" HeaderText="Home Town" SortExpression="hometown" />
            <asp:BoundField DataField="country" HeaderText="Country" SortExpression="country" />
            <asp:BoundField DataField="twitterPageUrl" HeaderText="Twitter Page Url" SortExpression="twitterPageUrl" />
        </Columns>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#af2121" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#ad2121" ForeColor="#FFFFCC" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#000000" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
    </asp:GridView>
    <asp:SqlDataSource ID="CandidateSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:VisualAnalyticConnectionString %>" SelectCommand="SELECT * FROM [contestant]" DeleteCommand="DELETE FROM [contestant] WHERE [contestantID] = @contestantID" InsertCommand="INSERT INTO [contestant] ([contestantID], [contestantName], [gender], [age], [hometown], [country], [image], [description], [fbPageUrl], [fbLikes], [fbTalking], [twitterPageUrl], [teamID], [roundID], [episode]) VALUES (@contestantID, @contestantName, @gender, @age, @hometown, @country, @image, @description, @fbPageUrl, @fbLikes, @fbTalking, @twitterPageUrl, @teamID, @roundID, @episode)" UpdateCommand="UPDATE [contestant] SET [contestantName] = @contestantName, [gender] = @gender, [age] = @age, [hometown] = @hometown, [country] = @country, [image] = @image, [description] = @description, [fbPageUrl] = @fbPageUrl, [fbLikes] = @fbLikes, [fbTalking] = @fbTalking, [twitterPageUrl] = @twitterPageUrl, [teamID] = @teamID, [roundID] = @roundID, [episode] = @episode WHERE [contestantID] = @contestantID">
        <DeleteParameters>
            <asp:Parameter Name="contestantID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="contestantID" Type="Int32" />
            <asp:Parameter Name="contestantName" Type="String" />
            <asp:Parameter Name="gender" Type="String" />
            <asp:Parameter Name="age" Type="Int32" />
            <asp:Parameter Name="hometown" Type="String" />
            <asp:Parameter Name="country" Type="String" />
            <asp:Parameter Name="image" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="fbPageUrl" Type="String" />
            <asp:Parameter Name="fbLikes" Type="Int32" />
            <asp:Parameter Name="fbTalking" Type="Int32" />
            <asp:Parameter Name="twitterPageUrl" Type="String" />
            <asp:Parameter Name="teamID" Type="Int32" />
            <asp:Parameter Name="roundID" Type="Int32" />
            <asp:Parameter Name="episode" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="contestantName" Type="String" />
            <asp:Parameter Name="gender" Type="String" />
            <asp:Parameter Name="age" Type="Int32" />
            <asp:Parameter Name="hometown" Type="String" />
            <asp:Parameter Name="country" Type="String" />
            <asp:Parameter Name="image" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="fbPageUrl" Type="String" />
            <asp:Parameter Name="fbLikes" Type="Int32" />
            <asp:Parameter Name="fbTalking" Type="Int32" />
            <asp:Parameter Name="twitterPageUrl" Type="String" />
            <asp:Parameter Name="teamID" Type="Int32" />
            <asp:Parameter Name="roundID" Type="Int32" />
            <asp:Parameter Name="episode" Type="Int32" />
            <asp:Parameter Name="contestantID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Panel ID="pnlAll" Visible="false" runat="server">
        <fieldset >
            <legend>Edit Candidates</legend>
            <asp:Panel ID="pnlSuccess" Visible="false" runat="server">
                <div class='alert alert-success'>
                    <strong>Done!</strong> candidate updated successfully.
                </div>
            </asp:Panel>
            <asp:Panel ID="pnlError" Visible="false" runat="server">
                <div class='alert alert-error'>
                    <strong>Error!</strong> candidate didn&#39;t update successfully.
                </div>
            </asp:Panel>
            <div class="control-group">
                <asp:Label ID="Label2" class="control-label" runat="server" Text="First Name"></asp:Label>
                <div class="controls">
                    <asp:TextBox ID="txtFname" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFname" ErrorMessage="*This information is required." ForeColor="#CC0000" ValidationGroup="Emp" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="Label4" class="control-label" runat="server" Text="Last Name"></asp:Label>
                <div class="controls">
                    <asp:TextBox ID="txtLastName" runat="server" ></asp:TextBox>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="Label10" class="control-label" runat="server" Text="Sex"></asp:Label>
                <div class="controls">
                    <asp:DropDownList ID="drpSex" class="span3" runat="server">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="Label11" class="control-label" runat="server" Text="Age"></asp:Label>
                <div class="controls">
                    <asp:DropDownList ID="txtAge" runat="server">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAge" ErrorMessage="*This information is required." ForeColor="#CC0000" ValidationGroup="Emp" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="Label5" class="control-label" runat="server" Text="Hometown"></asp:Label>
                <div class="controls">
                    <asp:TextBox ID="txtHometown" class="input-xxlarge" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtHometown" ErrorMessage="*This information is required." ForeColor="#CC0000" ValidationGroup="Emp" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="Label8" class="control-label" runat="server" Text="Country"></asp:Label>
                <div class="controls">
                    <asp:DropDownList ID="drpCountry" class="span3" runat="server">
                        <asp:ListItem Value="Null ">Select a Country</asp:ListItem>
                        <asp:ListItem Value="AF">Afghanistan</asp:ListItem>
                        <asp:ListItem Value="AL">Albania</asp:ListItem>
                        <asp:ListItem Value="DZ">Algeria</asp:ListItem>
                        <asp:ListItem Value="AS">American Samoa</asp:ListItem>
                        <asp:ListItem Value="AD">Andorra</asp:ListItem>
                        <asp:ListItem Value="AO">Angola</asp:ListItem>
                        <asp:ListItem Value="AI">Anguilla</asp:ListItem>
                        <asp:ListItem Value="AQ">Antarctica</asp:ListItem>
                        <asp:ListItem Value="AG">Antigua And Barbuda</asp:ListItem>
                        <asp:ListItem Value="AR">Argentina</asp:ListItem>
                        <asp:ListItem Value="AM">Armenia</asp:ListItem>
                        <asp:ListItem Value="AW">Aruba</asp:ListItem>
                        <asp:ListItem Value="AU">Australia</asp:ListItem>
                        <asp:ListItem Value="AT">Austria</asp:ListItem>
                        <asp:ListItem Value="AZ">Azerbaijan</asp:ListItem>
                        <asp:ListItem Value="BS">Bahamas</asp:ListItem>
                        <asp:ListItem Value="BH">Bahrain</asp:ListItem>
                        <asp:ListItem Value="BD">Bangladesh</asp:ListItem>
                        <asp:ListItem Value="BB">Barbados</asp:ListItem>
                        <asp:ListItem Value="BY">Belarus</asp:ListItem>
                        <asp:ListItem Value="BE">Belgium</asp:ListItem>
                        <asp:ListItem Value="BZ">Belize</asp:ListItem>
                        <asp:ListItem Value="BJ">Benin</asp:ListItem>
                        <asp:ListItem Value="BM">Bermuda</asp:ListItem>
                        <asp:ListItem Value="BT">Bhutan</asp:ListItem>
                        <asp:ListItem Value="BO">Bolivia</asp:ListItem>
                        <asp:ListItem Value="BA">Bosnia And Herzegowina</asp:ListItem>
                        <asp:ListItem Value="BW">Botswana</asp:ListItem>
                        <asp:ListItem Value="BV">Bouvet Island</asp:ListItem>
                        <asp:ListItem Value="BR">Brazil</asp:ListItem>
                        <asp:ListItem Value="IO">British Indian Ocean Territory</asp:ListItem>
                        <asp:ListItem Value="BN">Brunei Darussalam</asp:ListItem>
                        <asp:ListItem Value="BG">Bulgaria</asp:ListItem>
                        <asp:ListItem Value="BF">Burkina Faso</asp:ListItem>
                        <asp:ListItem Value="BI">Burundi</asp:ListItem>
                        <asp:ListItem Value="KH">Cambodia</asp:ListItem>
                        <asp:ListItem Value="CM">Cameroon</asp:ListItem>
                        <asp:ListItem Value="CA">Canada</asp:ListItem>
                        <asp:ListItem Value="CV">Cape Verde</asp:ListItem>
                        <asp:ListItem Value="KY">Cayman Islands</asp:ListItem>
                        <asp:ListItem Value="CF">Central African Republic</asp:ListItem>
                        <asp:ListItem Value="TD">Chad</asp:ListItem>
                        <asp:ListItem Value="CL">Chile</asp:ListItem>
                        <asp:ListItem Value="CN">China</asp:ListItem>
                        <asp:ListItem Value="CX">Christmas Island</asp:ListItem>
                        <asp:ListItem Value="CC">Cocos (Keeling) Islands</asp:ListItem>
                        <asp:ListItem Value="CO">Colombia</asp:ListItem>
                        <asp:ListItem Value="KM">Comoros</asp:ListItem>
                        <asp:ListItem Value="CG">Congo</asp:ListItem>
                        <asp:ListItem Value="CK">Cook Islands</asp:ListItem>
                        <asp:ListItem Value="CR">Costa Rica</asp:ListItem>
                        <asp:ListItem Value="CI">Cote D'Ivoire</asp:ListItem>
                        <asp:ListItem Value="HR">Croatia (Local Name: Hrvatska)</asp:ListItem>
                        <asp:ListItem Value="CU">Cuba</asp:ListItem>
                        <asp:ListItem Value="CY">Cyprus</asp:ListItem>
                        <asp:ListItem Value="CZ">Czech Republic</asp:ListItem>
                        <asp:ListItem Value="DK">Denmark</asp:ListItem>
                        <asp:ListItem Value="DJ">Djibouti</asp:ListItem>
                        <asp:ListItem Value="DM">Dominica</asp:ListItem>
                        <asp:ListItem Value="DO">Dominican Republic</asp:ListItem>
                        <asp:ListItem Value="TP">East Timor</asp:ListItem>
                        <asp:ListItem Value="EC">Ecuador</asp:ListItem>
                        <asp:ListItem Value="EG">Egypt</asp:ListItem>
                        <asp:ListItem Value="SV">El Salvador</asp:ListItem>
                        <asp:ListItem Value="GQ">Equatorial Guinea</asp:ListItem>
                        <asp:ListItem Value="ER">Eritrea</asp:ListItem>
                        <asp:ListItem Value="EE">Estonia</asp:ListItem>
                        <asp:ListItem Value="ET">Ethiopia</asp:ListItem>
                        <asp:ListItem Value="FK">Falkland Islands (Malvinas)</asp:ListItem>
                        <asp:ListItem Value="FO">Faroe Islands</asp:ListItem>
                        <asp:ListItem Value="FJ">Fiji</asp:ListItem>
                        <asp:ListItem Value="FI">Finland</asp:ListItem>
                        <asp:ListItem Value="FR">France</asp:ListItem>
                        <asp:ListItem Value="GF">French Guiana</asp:ListItem>
                        <asp:ListItem Value="PF">French Polynesia</asp:ListItem>
                        <asp:ListItem Value="TF">French Southern Territories</asp:ListItem>
                        <asp:ListItem Value="GA">Gabon</asp:ListItem>
                        <asp:ListItem Value="GM">Gambia</asp:ListItem>
                        <asp:ListItem Value="GE">Georgia</asp:ListItem>
                        <asp:ListItem Value="DE">Germany</asp:ListItem>
                        <asp:ListItem Value="GH">Ghana</asp:ListItem>
                        <asp:ListItem Value="GI">Gibraltar</asp:ListItem>
                        <asp:ListItem Value="GR">Greece</asp:ListItem>
                        <asp:ListItem Value="GL">Greenland</asp:ListItem>
                        <asp:ListItem Value="GD">Grenada</asp:ListItem>
                        <asp:ListItem Value="GP">Guadeloupe</asp:ListItem>
                        <asp:ListItem Value="GU">Guam</asp:ListItem>
                        <asp:ListItem Value="GT">Guatemala</asp:ListItem>
                        <asp:ListItem Value="GN">Guinea</asp:ListItem>
                        <asp:ListItem Value="GW">Guinea-Bissau</asp:ListItem>
                        <asp:ListItem Value="GY">Guyana</asp:ListItem>
                        <asp:ListItem Value="HT">Haiti</asp:ListItem>
                        <asp:ListItem Value="HM">Heard And Mc Donald Islands</asp:ListItem>
                        <asp:ListItem Value="VA">Holy See (Vatican City State)</asp:ListItem>
                        <asp:ListItem Value="HN">Honduras</asp:ListItem>
                        <asp:ListItem Value="HK">Hong Kong</asp:ListItem>
                        <asp:ListItem Value="HU">Hungary</asp:ListItem>
                        <asp:ListItem Value="IS">Icel And</asp:ListItem>
                        <asp:ListItem Value="IN">India</asp:ListItem>
                        <asp:ListItem Value="ID">Indonesia</asp:ListItem>
                        <asp:ListItem Value="IR">Iran (Islamic Republic Of)</asp:ListItem>
                        <asp:ListItem Value="IQ">Iraq</asp:ListItem>
                        <asp:ListItem Value="IE">Ireland</asp:ListItem>
                        <asp:ListItem Value="IL">Israel</asp:ListItem>
                        <asp:ListItem Value="IT">Italy</asp:ListItem>
                        <asp:ListItem Value="JM">Jamaica</asp:ListItem>
                        <asp:ListItem Value="JP">Japan</asp:ListItem>
                        <asp:ListItem Value="JO">Jordan</asp:ListItem>
                        <asp:ListItem Value="KZ">Kazakhstan</asp:ListItem>
                        <asp:ListItem Value="KE">Kenya</asp:ListItem>
                        <asp:ListItem Value="KI">Kiribati</asp:ListItem>
                        <asp:ListItem Value="KP">Korea, Dem People'S Republic</asp:ListItem>
                        <asp:ListItem Value="KR">Korea, Republic Of</asp:ListItem>
                        <asp:ListItem Value="KW">Kuwait</asp:ListItem>
                        <asp:ListItem Value="KG">Kyrgyzstan</asp:ListItem>
                        <asp:ListItem Value="LA">Lao People'S Dem Republic</asp:ListItem>
                        <asp:ListItem Value="LV">Latvia</asp:ListItem>
                        <asp:ListItem Value="LB">Lebanon</asp:ListItem>
                        <asp:ListItem Value="LS">Lesotho</asp:ListItem>
                        <asp:ListItem Value="LR">Liberia</asp:ListItem>
                        <asp:ListItem Value="LY">Libyan Arab Jamahiriya</asp:ListItem>
                        <asp:ListItem Value="LI">Liechtenstein</asp:ListItem>
                        <asp:ListItem Value="LT">Lithuania</asp:ListItem>
                        <asp:ListItem Value="LU">Luxembourg</asp:ListItem>
                        <asp:ListItem Value="MO">Macau</asp:ListItem>
                        <asp:ListItem Value="MK">Macedonia</asp:ListItem>
                        <asp:ListItem Value="MG">Madagascar</asp:ListItem>
                        <asp:ListItem Value="MW">Malawi</asp:ListItem>
                        <asp:ListItem Value="MY">Malaysia</asp:ListItem>
                        <asp:ListItem Value="MV">Maldives</asp:ListItem>
                        <asp:ListItem Value="ML">Mali</asp:ListItem>
                        <asp:ListItem Value="MT">Malta</asp:ListItem>
                        <asp:ListItem Value="MH">Marshall Islands</asp:ListItem>
                        <asp:ListItem Value="MQ">Martinique</asp:ListItem>
                        <asp:ListItem Value="MR">Mauritania</asp:ListItem>
                        <asp:ListItem Value="MU">Mauritius</asp:ListItem>
                        <asp:ListItem Value="YT">Mayotte</asp:ListItem>
                        <asp:ListItem Value="MX">Mexico</asp:ListItem>
                        <asp:ListItem Value="FM">Micronesia, Federated States</asp:ListItem>
                        <asp:ListItem Value="MD">Moldova, Republic Of</asp:ListItem>
                        <asp:ListItem Value="MC">Monaco</asp:ListItem>
                        <asp:ListItem Value="MN">Mongolia</asp:ListItem>
                        <asp:ListItem Value="MS">Montserrat</asp:ListItem>
                        <asp:ListItem Value="MA">Morocco</asp:ListItem>
                        <asp:ListItem Value="MZ">Mozambique</asp:ListItem>
                        <asp:ListItem Value="MM">Myanmar</asp:ListItem>
                        <asp:ListItem Value="NA">Namibia</asp:ListItem>
                        <asp:ListItem Value="NR">Nauru</asp:ListItem>
                        <asp:ListItem Value="NP">Nepal</asp:ListItem>
                        <asp:ListItem Value="NL">Netherlands</asp:ListItem>
                        <asp:ListItem Value="AN">Netherlands Ant Illes</asp:ListItem>
                        <asp:ListItem Value="NC">New Caledonia</asp:ListItem>
                        <asp:ListItem Value="NZ">New Zealand</asp:ListItem>
                        <asp:ListItem Value="NI">Nicaragua</asp:ListItem>
                        <asp:ListItem Value="NE">Niger</asp:ListItem>
                        <asp:ListItem Value="NG">Nigeria</asp:ListItem>
                        <asp:ListItem Value="NU">Niue</asp:ListItem>
                        <asp:ListItem Value="NF">Norfolk Island</asp:ListItem>
                        <asp:ListItem Value="MP">Northern Mariana Islands</asp:ListItem>
                        <asp:ListItem Value="NO">Norway</asp:ListItem>
                        <asp:ListItem Value="OM">Oman</asp:ListItem>
                        <asp:ListItem Value="PK">Pakistan</asp:ListItem>
                        <asp:ListItem Value="PW">Palau</asp:ListItem>
                        <asp:ListItem Value="PA">Panama</asp:ListItem>
                        <asp:ListItem Value="PG">Papua New Guinea</asp:ListItem>
                        <asp:ListItem Value="PY">Paraguay</asp:ListItem>
                        <asp:ListItem Value="PE">Peru</asp:ListItem>
                        <asp:ListItem Value="PH">Philippines</asp:ListItem>
                        <asp:ListItem Value="PN">Pitcairn</asp:ListItem>
                        <asp:ListItem Value="PL">Poland</asp:ListItem>
                        <asp:ListItem Value="PT">Portugal</asp:ListItem>
                        <asp:ListItem Value="PR">Puerto Rico</asp:ListItem>
                        <asp:ListItem Value="QA">Qatar</asp:ListItem>
                        <asp:ListItem Value="RE">Reunion</asp:ListItem>
                        <asp:ListItem Value="RO">Romania</asp:ListItem>
                        <asp:ListItem Value="RU">Russian Federation</asp:ListItem>
                        <asp:ListItem Value="RW">Rwanda</asp:ListItem>
                        <asp:ListItem Value="KN">Saint K Itts And Nevis</asp:ListItem>
                        <asp:ListItem Value="LC">Saint Lucia</asp:ListItem>
                        <asp:ListItem Value="VC">Saint Vincent, The Grenadines</asp:ListItem>
                        <asp:ListItem Value="WS">Samoa</asp:ListItem>
                        <asp:ListItem Value="SM">San Marino</asp:ListItem>
                        <asp:ListItem Value="ST">Sao Tome And Principe</asp:ListItem>
                        <asp:ListItem Value="SA">Saudi Arabia</asp:ListItem>
                        <asp:ListItem Value="SN">Senegal</asp:ListItem>
                        <asp:ListItem Value="SC">Seychelles</asp:ListItem>
                        <asp:ListItem Value="SL">Sierra Leone</asp:ListItem>
                        <asp:ListItem Value="SG">Singapore</asp:ListItem>
                        <asp:ListItem Value="SK">Slovakia (Slovak Republic)</asp:ListItem>
                        <asp:ListItem Value="SI">Slovenia</asp:ListItem>
                        <asp:ListItem Value="SB">Solomon Islands</asp:ListItem>
                        <asp:ListItem Value="SO">Somalia</asp:ListItem>
                        <asp:ListItem Value="ZA">South Africa</asp:ListItem>
                        <asp:ListItem Value="GS">South Georgia , S Sandwich Is.</asp:ListItem>
                        <asp:ListItem Value="ES">Spain</asp:ListItem>
                        <asp:ListItem Value="LK">Sri Lanka</asp:ListItem>
                        <asp:ListItem Value="SH">St. Helena</asp:ListItem>
                        <asp:ListItem Value="PM">St. Pierre And Miquelon</asp:ListItem>
                        <asp:ListItem Value="SD">Sudan</asp:ListItem>
                        <asp:ListItem Value="SR">Suriname</asp:ListItem>
                        <asp:ListItem Value="SJ">Svalbard, Jan Mayen Islands</asp:ListItem>
                        <asp:ListItem Value="SZ">Sw Aziland</asp:ListItem>
                        <asp:ListItem Value="SE">Sweden</asp:ListItem>
                        <asp:ListItem Value="CH">Switzerland</asp:ListItem>
                        <asp:ListItem Value="SY">Syrian Arab Republic</asp:ListItem>
                        <asp:ListItem Value="TW">Taiwan</asp:ListItem>
                        <asp:ListItem Value="TJ">Tajikistan</asp:ListItem>
                        <asp:ListItem Value="TZ">Tanzania, United Republic Of</asp:ListItem>
                        <asp:ListItem Value="TH">Thailand</asp:ListItem>
                        <asp:ListItem Value="TG">Togo</asp:ListItem>
                        <asp:ListItem Value="TK">Tokelau</asp:ListItem>
                        <asp:ListItem Value="TO">Tonga</asp:ListItem>
                        <asp:ListItem Value="TT">Trinidad And Tobago</asp:ListItem>
                        <asp:ListItem Value="TN">Tunisia</asp:ListItem>
                        <asp:ListItem Value="TR">Turkey</asp:ListItem>
                        <asp:ListItem Value="TM">Turkmenistan</asp:ListItem>
                        <asp:ListItem Value="TC">Turks And Caicos Islands</asp:ListItem>
                        <asp:ListItem Value="TV">Tuvalu</asp:ListItem>
                        <asp:ListItem Value="UG">Uganda</asp:ListItem>
                        <asp:ListItem Value="UA">Ukraine</asp:ListItem>
                        <asp:ListItem Value="AE">United Arab Emirates</asp:ListItem>
                        <asp:ListItem Value="GB">United Kingdom</asp:ListItem>
                        <asp:ListItem Value="US">United States</asp:ListItem>
                        <asp:ListItem Value="UM">United States Minor Is.</asp:ListItem>
                        <asp:ListItem Value="UY">Uruguay</asp:ListItem>
                        <asp:ListItem Value="UZ">Uzbekistan</asp:ListItem>
                        <asp:ListItem Value="VU">Vanuatu</asp:ListItem>
                        <asp:ListItem Value="VE">Venezuela</asp:ListItem>
                        <asp:ListItem Value="VN">Viet Nam</asp:ListItem>
                        <asp:ListItem Value="VG">Virgin Islands (British)</asp:ListItem>
                        <asp:ListItem Value="VI">Virgin Islands (U.S.)</asp:ListItem>
                        <asp:ListItem Value="WF">Wallis And Futuna Islands</asp:ListItem>
                        <asp:ListItem Value="EH">Western Sahara</asp:ListItem>
                        <asp:ListItem Value="YE">Yemen</asp:ListItem>
                        <asp:ListItem Value="ZR">Zaire</asp:ListItem>
                        <asp:ListItem Value="ZM">Zambia</asp:ListItem>
                        <asp:ListItem Value="ZW">Zimbabwe</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="Label1" class="control-label" runat="server" Text="Facebook URL"></asp:Label>
                <div class="controls">
                    <asp:TextBox ID="txtFb" class="input-xxlarge" runat="server" ></asp:TextBox>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="Label3" class="control-label" runat="server" Text="Twitter URL"></asp:Label>
                <div class="controls">
                    <asp:TextBox ID="txtTw" class="input-xxlarge" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtTw" ErrorMessage="*This information is required." ForeColor="#CC0000" ValidationGroup="Emp" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="Label12" class="control-label" runat="server" Text="Team"></asp:Label>
                <div class="controls">
                    <asp:DropDownList ID="drpTeam" class="span3" runat="server">
                        <asp:ListItem Value="1" >Kylie</asp:ListItem>
                        <asp:ListItem Value="2">Ricky</asp:ListItem>
                        <asp:ListItem Value="3">Tom</asp:ListItem>
                        <asp:ListItem Value="4">Will</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="Label13" class="control-label" runat="server" Text="Candidate Image"></asp:Label>
                <div class="controls">
                    <asp:FileUpload ID="fileImage" runat="server" />
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="Label9" class="control-label" runat="server" Text="Description"></asp:Label>
                <div class="controls">
                    <asp:TextBox ID="txtDescription" runat="server"  TextMode="MultiLine" Rows="5" Width="53%"></asp:TextBox>
                </div>
            </div>
            <div class="form-actions">
                <asp:Button ID="btnsubmit"  class="btn btn-primary" runat="server" Text="Edit" OnClick="btnsubmit_Click" ValidationGroup="Emp"/>
                <asp:Button ID="btnDelete"  runat="server" CssClass="btn btn-danger" Text="Delete" OnClick="btnDelete_Click" />
                <asp:Button ID="btncancel" class="btn " runat="server" Text="Cancel" OnClick="btncancel_Click" />
            </div>
        </fieldset></asp:Panel>
    <br />
     <form class="page-header" style="background-color: #FFFFFF">
            &nbsp;</form>
</asp:Content>

