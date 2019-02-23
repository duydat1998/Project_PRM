package demo.datnd.api_android_demo;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.squareup.picasso.Picasso;

import java.util.List;

public class UserAdapter extends RecyclerView.Adapter<UserAdapter.UserItemViewHolder> {
    private List<User> users;
    private Context context;

    //luu danh sach user va context
    public UserAdapter(List<User> users, Context c) {
        this.users = users;
        this.context = c;
    }

    @Override
    public int getItemCount() {
        return users.size();
    }

    @Override
    public UserItemViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.item_user, parent, false);

        return new UserItemViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(UserItemViewHolder holder, int position) {
        User u = users.get(position);
        Picasso.with(context)
                .load(u.avatar_url)
                .into(holder.ivAvatar);
        holder.tvLoginName.setText(u.login);
        holder.tvId.setText(String.valueOf(u.id));
    }


    //luu lai cac view de su dung lai
    public static class UserItemViewHolder extends RecyclerView.ViewHolder {
        public TextView tvLoginName;
        public TextView tvId;
        public ImageView ivAvatar;

        public UserItemViewHolder(View itemView) {
            super(itemView);
            tvLoginName =  itemView.findViewById(R.id.tv_login_name);
            tvId =  itemView.findViewById(R.id.tv_id);
            ivAvatar = itemView.findViewById(R.id.iv_avatar);
        }
    }
}

