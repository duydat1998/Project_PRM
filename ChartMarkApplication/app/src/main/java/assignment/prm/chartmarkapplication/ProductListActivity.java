package assignment.prm.chartmarkapplication;

import android.content.Intent;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBar;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.MenuItem;
import android.view.View;
import android.widget.TextView;

import com.squareup.moshi.JsonAdapter;
import com.squareup.moshi.Moshi;
import com.squareup.moshi.Types;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.List;

import assignment.prm.chartmarkapplication.Adapter.GeneralProductAdapter;
import assignment.prm.chartmarkapplication.Model.GeneralProduct;
import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class ProductListActivity extends AppCompatActivity {

    private DrawerLayout drawerLayout;

    private String category;
    private TextView txtCategory;
    private RecyclerView rvProducts;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_product_list);
        setMenu();
        Intent intent = getIntent();
        category = intent.getStringExtra("category");
        if(category != null){
            txtCategory = findViewById(R.id.txtCategory);
            txtCategory.setText(category.toUpperCase());
        }
        showProducts();
    }

    private void showProducts() {
        rvProducts = findViewById(R.id.rvProducts);
        rvProducts.setLayoutManager(new GridLayoutManager(this, 2));

        OkHttpClient okHttpClient = new OkHttpClient();
        Moshi moshi = new Moshi.Builder().build();

        Type productType = Types.newParameterizedType(List.class, GeneralProduct.class);
        final JsonAdapter<List<GeneralProduct>> jsonAdapter = moshi.adapter(productType);

//        String domain = getResources().getString(R.string.home_api);
//        String domain = getResources().getString(R.string.school_api);
        String domain = getResources().getString(R.string.virtual_api);
        Request request;

        switch (category){
            case "laptop":
                request = new Request.Builder()
                        .url(domain + "api/Laptops").build();
                break;
            case "cpu":
                request = new Request.Builder()
                        .url(domain + "api/CPUs").build();
                break;
            case "vga":
                request = new Request.Builder()
                        .url(domain + "api/VGAs").build();
                break;
            case "headphone":
                request = new Request.Builder()
                        .url(domain + "api/HeadPhones").build();
                break;
            case "mouse":
                request = new Request.Builder()
                        .url(domain + "api/Mouses").build();
                break;
            case "keyboard":
                request = new Request.Builder()
                        .url(domain + "api/Keyboards").build();
                break;
            default:
                request = new Request.Builder()
                        .url(domain + "api/Laptops").build();
        }

        okHttpClient.newCall(request).enqueue(new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {
                e.printStackTrace();
                Log.e("Get data API Error: ", e.getMessage());
            }

            @Override
            public void onResponse(Call call, Response response) throws IOException {

                String json = response.body().string();
                final List<GeneralProduct> generalProducts = jsonAdapter.fromJson(json);

                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        rvProducts.setAdapter(new GeneralProductAdapter(generalProducts, ProductListActivity.this));
                    }
                });
            }
        });
    }

    private void setMenu() {
        drawerLayout = findViewById(R.id.drawer_layout);

        NavigationView navigationView = findViewById(R.id.nav_view);
        navigationView.setNavigationItemSelectedListener(
                new NavigationView.OnNavigationItemSelectedListener() {
                    @Override
                    public boolean onNavigationItemSelected(MenuItem menuItem) {
                        // set item as selected to persist highlight
                        // close drawer when item is tapped
                        drawerLayout.closeDrawers();
                        String category = "laptop";
                        switch (menuItem.getItemId()){
                            case R.id.nav_laptop:
                                category = "laptop";
                                break;
                            case R.id.nav_cpu:
                                category = "cpu";
                                break;
                            case R.id.nav_headphone:
                                category = "headphone";
                                break;
                            case R.id.nav_keyboard:
                                category = "keyboard";
                                break;
                            case R.id.nav_mouse:
                                category = "mouse";
                                break;
                            case R.id.nav_vga:
                                category = "vga";
                                break;
                        }
                        Intent intent = new Intent(getBaseContext(), ProductListActivity.class);
                        intent.putExtra("category", category);
                        startActivity(intent);
                        // Add code here to update the UI based on the item selected
                        // For example, swap UI fragments here

                        return true;
                    }
                });

        android.support.v7.widget.Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        ActionBar actionbar = getSupportActionBar();
        actionbar.setDisplayHomeAsUpEnabled(true);
        actionbar.setHomeAsUpIndicator(R.drawable.ic_menu);

        drawerLayout.addDrawerListener(
                new DrawerLayout.DrawerListener() {
                    @Override
                    public void onDrawerSlide(View drawerView, float slideOffset) {
                        // Respond when the drawer's position changes
                    }

                    @Override
                    public void onDrawerOpened(View drawerView) {
                        // Respond when the drawer is opened
                    }

                    @Override
                    public void onDrawerClosed(View drawerView) {
                        // Respond when the drawer is closed
                    }

                    @Override
                    public void onDrawerStateChanged(int newState) {
                        // Respond when the drawer motion state changes
                    }
                }
        );
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case android.R.id.home:
                drawerLayout.openDrawer(GravityCompat.START);
                return true;
        }
        return super.onOptionsItemSelected(item);
    }

    public void clickToViewLoveList(View view) {
        Intent intent = new Intent(this, LoveListActivity.class);
        startActivity(intent);
    }

    public void clickToViewCompareList(View view) {
        Intent intent = new Intent(this, CompareActivity.class);
        startActivity(intent);
    }
}
