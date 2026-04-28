import 'package:shopsy/screens/categories/products.dart';
import 'package:shopsy/models/category_model.dart';
import 'package:shopsy/data/app_data.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final ScrollController _leftController = ScrollController();
  final ScrollController _rightController = ScrollController();
  int selectedIndex = 0;
  bool _isSyncing = false;
  final List<GlobalKey> keys = [];
  List<double> _offsets = [];

  @override
  void initState() {
    super.initState();
    keys.addAll(List.generate(appCategories.length, (index) => GlobalKey()));
    WidgetsBinding.instance.addPostFrameCallback((_) => _calculateOffsets());
  }

  @override
  void dispose() {
    _rightController.dispose();
    _leftController.dispose();
    super.dispose();
  }

  void _calculateOffsets() {
    _offsets.clear();
    for (int i = 0; i < appCategories.length; i++) {
      final ctx = keys[i].currentContext;
      if (ctx != null) {
        final box = ctx.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero, ancestor: context.findRenderObject());
        // Calculate offset relative to the scroll view
        _offsets.add(_rightController.offset + position.dy - AppBar().preferredSize.height - MediaQuery.of(context).padding.top - 10);
      }
    }
  }

  bool _onScrollNotification(ScrollNotification notification) {
    if (_isSyncing) return false;

    if (notification is ScrollUpdateNotification) {
      if (_offsets.isEmpty) _calculateOffsets();

      double offset = _rightController.offset;
      int newIndex = 0;

      for (int i = 0; i < _offsets.length; i++) {
        if (offset >= _offsets[i] - 10) {
          newIndex = i;
        } else {
          break;
        }
      }

      if (selectedIndex != newIndex) {
        setState(() {
          selectedIndex = newIndex;
        });
        _scrollLeftTo(newIndex);
      }
    }
    return false;
  }

  void _scrollLeftTo(int index) {
    if (!_leftController.hasClients) return;
    double itemHeight = 75.0; // Adjusted based on new padding
    double target = (index * itemHeight) - (MediaQuery.of(context).size.height * 0.3);
    
    _leftController.animateTo(
      target.clamp(0.0, _leftController.position.maxScrollExtent),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOutCubic,
    );
  }

  void scrollToCategory(int index) {
    if (selectedIndex == index) return;
    
    _isSyncing = true;
    setState(() => selectedIndex = index);

    final ctx = keys[index].currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
        alignment: 0.0,
      ).then((_) {
        _isSyncing = false;
      });
    } else {
      _isSyncing = false;
    }

    _scrollLeftTo(index);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    const Color primaryColor = Color(0xFF543CEA);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
       appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 45,
        title: Text(
          "Categories",
          style: TextStyle(color: Colors.black, fontSize: width * 0.04),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: Colors.grey.shade300),
        ),
      ),

      body: Column(
        children: [
         
        
          Expanded(
            child: Row(
              children: [
             
                Container(
                  width: width * 0.21,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    border: Border(
                      right: BorderSide(
                        color: Colors.grey.shade200,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: ListView.builder(
                    controller: _leftController,
                    padding: EdgeInsets.zero,
                    itemCount: appCategories.length,
                    itemBuilder: (context, index) {
                      bool isSelected = selectedIndex == index;

                      return GestureDetector(
                        onTap: () => scrollToCategory(index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFFF5F5F5),
                            border: Border(
                              left: BorderSide(
                                color: isSelected
                                    ? primaryColor
                                    : Colors.transparent,
                                width: 3.5,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 4,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: isSelected ? primaryColor.withOpacity(0.1) : Colors.transparent,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  appCategories[index].icon,
                                  size: 24,
                                  color: isSelected
                                      ? primaryColor
                                      : Colors.grey[600],
                                ),
                              ),
                              
                              const SizedBox(height: 6),
                              Text(
                                appCategories[index].name,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 10,
                                  height: 1.2,
                                  fontWeight: isSelected
                                      ? FontWeight.w700
                                      : FontWeight.w500,
                                  color: isSelected
                                      ? primaryColor
                                      : Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

               
                Expanded(
                  child: NotificationListener<ScrollNotification>(
                    onNotification: _onScrollNotification,
                    child: SingleChildScrollView(
                      controller: _rightController,
                      child: Column(
                        children: List.generate(appCategories.length, (index) {
                        final categoryName =
                            appCategories[index].name;
                        final items = appSubCategories[categoryName] ?? [];

                        return Container(
                          key: keys[index],
                          margin: const EdgeInsets.only(bottom: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             
                              Container(
                                width: double.infinity,
                                color: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 12,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 4,
                                      height: 18,
                                      decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        categoryName,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF212121),
                                        ),
                                      ),
                                    ),
                                   
                                  ],
                                ),
                              ),

                              
                              Container(
                                color: Colors.white,
                                padding:
                                    const EdgeInsets.fromLTRB(10, 4, 10, 14),
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  physics:
                                      const NeverScrollableScrollPhysics(),
                                  itemCount: items.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 0.78,
                                  ),
                                  itemBuilder: (context, i) {
                                    final item = items[i];
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Products()));
                                      },
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    const Color(0xFFF9F9FB),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color:
                                                      Colors.grey.shade200,
                                                  width: 0.8,
                                                ),
                                              ),
                                              padding:
                                                  const EdgeInsets.all(8),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.asset(
                                                  item.image,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          Text(
                                            item.title,
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey[800],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ),
             ) ],
            ),
          ),
        ],
      ),
    );
  }
}