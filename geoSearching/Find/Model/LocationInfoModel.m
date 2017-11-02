//
//  LocationInfoModel.m
//  geoSearching
//
//  Created by 陈川 on 2017/10/31.
//

#import "LocationInfoModel.h"

@interface LocationInfoModel()

@property (nonatomic, strong) NSArray *titles;
@end

@implementation LocationInfoModel

- (NSArray *)titles {
    if (_titles == nil) {
        _titles = [NSArray arrayWithObjects:@"Grocery Store", @"Car Shop", @"Super Market", @"Walmart", @"Laundry", nil];
    }
    return _titles;
}


+ (instancetype)randomModel {
    LocationInfoModel *model = [[LocationInfoModel alloc] init];
    NSInteger index = arc4random_uniform(5);
    model.locTitle = [model.titles objectAtIndex:index];
    model.locDescription = @"The team at this full service supermarket in the heart of the Whistler Village is committed to excellence in all that it does; seeking out the freshest ingredients locally as well as globally, providing a product mix to satisfy the many tastes and dietary needs of our broad customer base, all provided in a clean and constantly updated store.";
    
    NSInteger like = arc4random_uniform(100);
    model.locLikeCount = [NSString stringWithFormat:@"%zd", like];
    NSInteger distance1 = arc4random_uniform(20);
    NSInteger distance2 = arc4random_uniform(10);
    model.locDistance = [NSString stringWithFormat:@"%zd.%zdkm", distance1, distance2];
    return model;
}

+ (instancetype)modelWithTitle:(NSString *)title {
    LocationInfoModel *model = [self randomModel];
    model.locTitle = title;
    if ([title isEqualToString:@"Squiggly Bridge"]) {
        model.locDescription = @"The Tradeston Bridge, colloquially known as the squiggly bridge is a pedestrian bridge across the River Clyde which opened on 14 May 2009. It links the districts of Anderston (on the north bank) to Tradeston (on the south bank) - the aim of the bridge being to aid the regeneration of Tradeston by giving it a direct link to the city's financial district on the western side of the city centre.\n\nThe span is horizontally curved in an S shape with outward canting on both curves.\n\nIf you're lucky you will feel it wobble!";
        model.detailImage = @"Tradeston_Bridge";
    } else if ([title isEqualToString:@"A Grove by the Kelvin"]) {
        model.locDescription = @"This cache was updated on 01.08.17. Any comments in the logs have been addressed.\n\nHi folks. The walk is less than a mile and could be easily completed in under a half hour. We will be visiting some of the famous, and noteworthy, locations within the park. As this is a public park there will be muggles. Although the park may be open in the evenings I would strongly discourage someone against doing this cache at night time. Enjoy!\n\nThomas Carlyle Statue\n\nOur first location is right here at the Thomas Carlyle Statue.\n\nThomas Carlyle was born on December 4, 1795, in Galloway, Scotland and was a famous philosopher, writer and historian. He actually attended the University of Edinburgh and from 1823 onwards he published for various different magazines. His writing became widely known after the publication of The French Revolutionin 1837. I personally will leave this short biography here, because in Carlyle’s Will it states, in reference to a biography, 'I had really rather that there should be none'. So my apologies that I had the cheek to tell you all a little about him.\n\nThe Cache\n\nIf you look carefully at the statue you will see it is made out of several rocks placed on top of each other, how many rocks are there? This will be A.\n\nIf you then look east over the bridge you will see there are a number of black ornaments. How many are there? This number divided by two will be B.\n\nWe are now going to pop down to see The Bandstand (N 55° 52.170 W 004° 17.160).\n\nThe Bandstand\n\nThe bandstand was built in 1924 and designed by James Miller. It was a popular location for outdoor music until it became neglected and vandalised around 1995. Many Scottish bands and musicians such as Belle & Sebastian, Franz Ferdinand, and Horse expressed support for the restoration of Kelvingrove Park's Bandstand. In April 2012 the Scottish Parliament provided a £245,000 building repair grant for the restoration of the bandstand. When this cache was created there had been no visible work done. However, it has now been done up and is looking quite impressive. It re-opened in May 2014.\n\nThe Cache\n\nIf you look down to where people sit at the bandstand you will see there are many rows of cement seating. However, at the front there are several rows of wooden seating.\n\nHow many are there? This will be C.\n\nYou can also see that on top of the bandstand building there are a number of large speakers. There have always been large speakers there, and I believe they are still the originals, which were there since before the restoration. They used to be black, but are now silvery-white. How many of them are there? That will be D.\n\nWe are now going to visit one of the most famous statues in the park, this is the statue dedicated to Lord Kelvin (N 55° 52.178 W 004° 17.225) where there are some excellent views of the Kelvingrove Art Gallery.\n\nLord Kelvin Statue\n\nWilliam Thomson was born in Belfast, Ireland in 1824. However moved to Glasgow at a young age and started his studies at the University of Glasgow aged just ten. He is well known for his work in the mathematical analysis of electricity and formulation of the first and second laws of thermodynamics. However, his most famed achievement is arguably the discovery of absolute zero, at -273.15 Celsius. Due to this achievement absolute temperatures are stated in units of Kelvin in recognition of his discovery. On his ennoblement in 1892, in honour of his achievements in thermodynamics, he choose the title of Lord Kelvin after the name of the river which flowed close to his office at the university.\n\nThe Cache\n\nBehind the Lord Kelvin Statue there are a number of black benches. How many are there? This will be E.\n\nWe are now going to take a very short walk to visit Lord Kelvin’s closest friend, in the statue world, Joseph Lister (N 55° 52.165 W 004° 17.266). From here you can take a very nice photo of Glasgow University to the north of you.\n\nJoseph Lister Statue\n\nJoseph Lister was born in England in 1827, and trained as a doctor at University College London. In 1854 Lister moved to Edinburgh to become a surgeon's assistant. It was here that he first became interested in the study of antiseptics. Later, while working at the Glasgow Royal Infirmary, he promoted the idea of sterile surgery and it is for this that he is best known. Lister successfully introduced carbolic acid (now known as phenol) to sterilise surgical instruments and to clean wounds, which led to a reduction in post-operative infections and made surgery safer for patients.\n\nThe Cache\n\nAbove Joseph Lister’s name there is a symbol. How many different species of animal appear on this symbol? This will be F.\n\nWe are now going to cross the River Kelvin and visit the Stewart Memorial Fountain (N 55° 52.086 W 004° 17.034). Before you do so you may want to take a picture of the modern sculpture, The Islamist, which is located a couple of steps south west of where you are. I know nothing about this statue so if anyone can share some information I would appreciate it.\n\nIf you cross the bridge on Kelvin Way you can take some nice photos of Kelvingrove Art Gallery to your west. You can also see some of the most expensive houses in Glasgow to your east. When you re-enter the park en route to the fountain you will also pass the Kelvingrove Skate Park which never ever seems to be empty. Ever.\n\nStewart Memorial Fountain\n\nThe Stewart Memorial Fountain was built to commemorate Lord Provost Robert Stewart (1851–1854) and his achievement of providing the city with fresh water from Loch Katrine. The fountain was built in 1872 to a design by James Sellars. It is built of granite, sandstone, marble and bronze, features imagery of the Trossachs, and is topped by a figure of Sir Walter Scott's Lady of the Lake.\n\nThe Cache\n\nOn the first level up you can see statues of different types of birds. These statues are in pairs and there is a small plaque beneath each pair. Over the years they have been damaged and replaced, stolen and replaced, damaged and replaced and so forth. Count how many statues there are. This number minus one will be G.\n\nOn the side of the fountain that faces west, towards Kelvingrove Art Gallery, there is a black plaque with a number of people on it. How many human people are there? This will be H.\n\nNow let’s go get the cache!\n\nThe Cache\n\nThe cache can be found in another lovely part of the park at\n\nN (B+F)(G-H)° (E-G)H.(B-D)BC\nW (B-D)(E-C-B)D° F(G-F).C(C-H)G\n\nHere’s hoping you have enjoyed your little tour of Kelvingrove Park.";
        model.detailImage = @"Kelvin";
    } else if ([title isEqualToString:@"Glasgow Riverside Museum"]) {
        model.locDescription = @"Geocaching Scotland\n\nContinuing your walk behind the museum there is a paving slab denoting the year in which a Swedish warship sank.\n\nThe number of letters in the ships name is J.\n\nAdd the four digits together from the year the warship sank. Then add the resulting digits together.\n\nThis is G.\n\n\n\nQuestion 6.\n\nUsing the information boards near the Glenlee, subtract the number of days of the winter storm from the number of years Capt Richard Owens was in command.\n\nThis is F.\n\n\n\nThe Glenlee was launched 3rd Dec 1896. After how many years was she renamed.\n\nThis is H.\n\nQuestion 7.\n\nContinuing along the riverside you will come to a sculpture of a stone hogback.\n\nAdd together the four digits denoting when the cast copy of the sculpture of the stone hogback was made? This is X.\n\nAdd together the four digits of the year the Glenlee was towed to her current birth. This is Y.\n\nY - X = B.\n\nThe cache can be found at:\n\nN55° AB.CDE\n\nW004° FG.HJK";
        model.detailImage = @"museum";
    } else if ([title isEqualToString:@"University of Glasgow"]) {
        model.locDescription = @"The University of Glasgow (Scottish Gaelic: Oilthigh Ghlaschu, Latin: Universitas Glasguensis) (abbreviated as Glas. in post-nominals) is the fourth oldest university in the English-speaking world and one of Scotland's four ancient universities. It was founded in 1451. Along with the University of Edinburgh, the University was part of the Scottish Enlightenment during the 18th century. It is currently a member of Universitas 21, the international network of research universities and the Russell Group.\n\nIn common with universities of the pre-modern era, Glasgow originally educated students primarily from wealthy backgrounds, however it became a pioneer[citation needed] in British higher education in the 19th century by also providing for the needs of students from the growing urban and commercial middle class. Glasgow University served all of these students by preparing them for professions: the law, medicine, civil service, teaching, and the church. It also trained smaller but growing numbers for careers in science and engineering.\n\nOriginally located in the city's High Street, since 1870 the main University campus has been located at Gilmorehill in the West End of the city.[5] Additionally, a number of university buildings are located elsewhere, such as the Veterinary School in Bearsden, and the Crichton Campus in Dumfries.\n\nAlumni or former staff of the University include a founding father of the United States, philosopher Francis Hutcheson, engineer James Watt, philosopher and economist Adam Smith, physicist Lord Kelvin, surgeon Joseph Lister, 1st Baron Lister, seven Nobel laureates, and three British Prime Ministers.";
        model.detailImage = @"university";
    } else if ([title isEqualToString:@"Kelvingrove Art Gallery and Museum"]) {
        model.locDescription = @"The Kelvingrove Art Gallery and Museum is a museum and art gallery in Glasgow, Scotland. It reopened in 2006 after a three-year refurbishment and since then has been one of Scotland's most popular visitor attractions.\n\nThe gallery is located on Argyle Street, in the West End of the city, on the banks of the River Kelvin (opposite the architecturally similar Kelvin Hall, which was built in matching style in the 1920s, after the previous hall had been destroyed by fire). It is adjacent to Kelvingrove Park and is situated near the main campus of the University of Glasgow on Gilmorehill.\n\nKelvingrove Art Gallery and Museum is one of Scotland's most popular free attractions and features 22 themed, state-of-the-art galleries displaying an astonishing 8000 objects.";
        model.detailImage = @"kelvingrove";
    } else if ([title isEqualToString:@"George Square"]) {
        model.locDescription = @"George Square is the principal civic square in the city of Glasgow, Scotland. It is named after King George III. Laid out in 1781, George Square is surrounded by architecturally important buildings including on the east side the palatial Municipal Chambers, also known as the City Chambers, whose foundation stone was laid in 1883. Built by Glasgow Corporation it is the continuing headquarters of Glasgow City Council. Joseph Swan`s panoramic engraving of 1829 shows the early development of the square and its surrounding buildings.\n\nThe square boasts an important collection of statues and monuments, including those dedicated to Robert Burns, James Watt, Sir Robert Peel and Sir Walter Scott.";
        model.detailImage = @"George";
    } else if ([title isEqualToString:@"Gallery of Modern Art"]) {
        model.locDescription = @"The Gallery of Modern Art (GoMA) is the main gallery of contemporary art in Glasgow, Scotland.\n\nGoMA offers a programme of temporary exhibitions and workshops. GoMA displays work by local and international artists as well as addressing contemporary social issues through its major biannual projects.";
        model.detailImage = @"modernArt";
    } else if ([title isEqualToString:@"G12 Cafe 42 University Ave, Glasgow, G12 8NN"]) {
        model.locDescription = @"G12 Cafe is glass fronted Cafe/Bar along University Avenue which can be hired for small events and meetings.\n\nFind the Cache and scan the QR code, you can get 10% off the first cup of coffee, half price of the second cup of coffee.";
        model.detailImage = @"cafe";
    } else if ([title isEqualToString:@"Chow Chinese Restaurant  98 Byres Road, Glasgow, G12 8TB"]) {
        model.locDescription = @"Chow is a Chinese takeaway in Glasgow. Why don't you try our Prawn Cocktail or Pick 'n' Mix 3?\n\nFind the Cache and scan the QR code, you can get one sample that one course like Kung Pao Chicken or Yangzhou fried rice.";
        model.detailImage = @"chow";
    }
    
    return model;
}

@end
